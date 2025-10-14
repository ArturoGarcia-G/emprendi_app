import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/models/producto.dart' as model;

class InventarioMovimientoLocalRepo {
  final AppDatabase db;
  InventarioMovimientoLocalRepo(this.db);

  Future<InventarioMovimientosCompanion> agregarMovimientoInventario({
    String? ventaId,
    required String productoId,
    required int cantidad,
    required String descripcion,
    required String tipo,
  }) async {
    final inventarioMovimientoId = const Uuid().v4();
    final inventarioMovimiento = InventarioMovimientosCompanion.insert(
      inventarioMovimientoId: inventarioMovimientoId,
      productoId: productoId,
      ventaId: Value(ventaId),
      cantidad: cantidad,
      descripcion: descripcion,
      tipo: tipo,
      statusSincronizacion: const Value('creacion_pendiente'),
    );

    await db.into(db.inventarioMovimientos).insert(inventarioMovimiento);

    return inventarioMovimiento;
  }

  Future<List<model.Producto>> listarProductos() async {
    final entities = await db.select(db.productos).get();

    // Mapeamos ProductoEntity a Producto
    return entities
        .map(
          (entity) => model.Producto(
            productoId: entity.uuid,
            sku: entity.sku,
            nombre: entity.nombre,
            stock: entity.stock,
            precio: entity.precio,
            costo: entity.costo,
            status: entity.status,
            registroFecha: entity.registroFecha,
            actualizacionFecha: entity.actualizacionFecha,
            statusSincronizacion: entity.statusSincronizacion,
          ),
        )
        .toList();
  }

  Future<void> upsertProducto(model.Producto p) async {
    final companion = ProductosCompanion(
      uuid: Value(p.productoId ?? const Uuid().v4()),
      sku: Value(p.sku ?? ''),
      nombre: Value(p.nombre ?? ''),
      stock: Value(p.stock ?? 0),
      precio: Value(p.precio ?? 0),
      costo: Value(p.costo ?? 0),
      status: Value(p.status ?? 'activo'),
      registroFecha: Value(p.registroFecha ?? DateTime.now()),
      actualizacionFecha: Value(p.registroFecha),
      statusSincronizacion: const Value(StatusConsts.sincronizado),
    );
    await db.into(db.productos).insertOnConflictUpdate(companion);
  }

  Future<void> actualizarSincronizacion(
    InventarioMovimientosCompanion inventarioMovimiento,
  ) async {
    await db
        .update(db.inventarioMovimientos)
        .replace(
          inventarioMovimiento.copyWith(
            statusSincronizacion: const Value(StatusConsts.sincronizado),
          ),
        );
  }
}
