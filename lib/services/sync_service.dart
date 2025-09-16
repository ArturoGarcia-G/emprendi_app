import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/repositories/producto_local_repository.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import '../api/producto_api.dart';

class SyncService {
  final AppDatabase db;
  final ProductoApi productoApi;
  late ProductoLocalRepository productoLocalRepo;
  Timer? _timer;

  SyncService({required this.db, required this.productoApi}) {
    productoLocalRepo = ProductoLocalRepository(db);
  }

  void startAutoSync({Duration interval = const Duration(seconds: 300)}) {
    _timer = Timer.periodic(interval, (_) async {
      final connectivity = await Connectivity().checkConnectivity();
      if (connectivity != ConnectivityResult.none) {
        await syncProductos();
      }
    });
  }

  void stopAutoSync() {
    _timer?.cancel();
  }

  Future<void> syncProductos() async {
    final query = db.select(db.productos)
      ..where(
        (tbl) => tbl.statusSincronizacion.isNotIn([StatusConsts.sincronizado]),
      );

    final pendientes = await query.get();

    for (var pendiente in pendientes) {
      try {
        if (pendiente.statusSincronizacion == 'creacion_pendiente') {
          await productoApi.agregarProducto(
            productoId: pendiente.uuid,
            sku: pendiente.sku,
            nombre: pendiente.nombre,
            stock: pendiente.stock,
            precio: pendiente.precio,
            costo: pendiente.costo,
          );
        }
        // } else if (pendiente.statusSincronizacion == 'pending_update') {
        //   await productoApi.editarProducto(
        //     uuid: pendiente.uuid,
        //     nombre: pendiente.nombre,
        //     stock: pendiente.stock,
        //     precio: pendiente.precio,
        //     costo: pendiente.costo,
        //   );
        // } else if (pendiente.statusSincronizacion == 'pending_delete') {
        //   await productoApi.eliminarProducto(pendiente.uuid);
        // }

        // Si API responde bien → marcar como sincronizado
        await db
            .update(db.productos)
            .replace(
              pendiente.copyWith(
                statusSincronizacion: StatusConsts.sincronizado,
              ),
            );
      } catch (_) {
        // Falló la sincronización, se queda pendiente
      }
    }

    try {
      final productosApi = await productoApi.listarProductos();

      for (var p in productosApi) {
        await productoLocalRepo.upsertProducto(p);
      }
    } catch (_) {
      // No hay internet o fallo, dejamos los datos locales
    }
  }
}
