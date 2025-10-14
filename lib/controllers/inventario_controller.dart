import 'package:emprendi_app/api/inventario_api.dart';
import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/repositories/inventario_movimiento_local_repo.dart';
import 'package:get/get.dart';

class InventarioController extends GetxController {
  InventarioController();

  final InventarioApi inventrarioApi = Get.find<InventarioApi>();
  var isLoading = false.obs;
  var productos = <Producto>[].obs;

  // Método para crear un producto
  Future<void> agregarMovimientoInventario({
    String? ventaId,
    required String productoId,
    required int cantidad,
    required String descripcion,
    required String tipo,
  }) async {
    try {
      // Guardar offline en SQLite
      final inventarioLocalRepo = InventarioMovimientoLocalRepo(AppDatabase());
      final inventarioMovimientoLocal = await inventarioLocalRepo
          .agregarMovimientoInventario(
            productoId: productoId,
            ventaId: ventaId,
            cantidad: cantidad,
            descripcion: descripcion,
            tipo: tipo,
          );

      // Intentar mandar al servidor
      try {
        await inventrarioApi.agregarMovimientoInventario(
          inventarioMovimientoId:
              inventarioMovimientoLocal.inventarioMovimientoId.value,
          productoId: productoId,
          ventaId: ventaId,
          cantidad: cantidad,
          descripcion: descripcion,
          tipo: tipo,
        );

        await inventarioLocalRepo.actualizarSincronizacion(
          inventarioMovimientoLocal,
        );
      } catch (_) {}

      SnackbarHelper.show(
        'Ajuste generado correctamente',
        type: SnackbarType.success,
      );
    } catch (e) {
      SnackbarHelper.show(e.toString());
    } finally {}
  }
}
