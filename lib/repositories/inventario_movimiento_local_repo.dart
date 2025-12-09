import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/models/producto.dart' as model;
import 'package:emprendi_app/models/inventario_movimiento.dart' as movimiento_model;

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

  // Método para listar movimientos de inventario con información del producto
  Future<List<movimiento_model.InventarioMovimiento>> listarMovimientos() async {
    // Query con LEFT JOIN a la tabla productos
    final query = db.select(db.inventarioMovimientos).join([
      leftOuterJoin(db.productos, db.productos.uuid.equalsExp(db.inventarioMovimientos.productoId))
    ]);

    final results = await query.get();

    // Mapeamos los resultados incluyendo información del producto
    return results.map((row) {
      final movimientoEntity = row.readTable(db.inventarioMovimientos);
      final productoEntity = row.readTableOrNull(db.productos);

      return movimiento_model.InventarioMovimiento(
        inventarioMovimientoId: movimientoEntity.inventarioMovimientoId,
        productoId: movimientoEntity.productoId,
        ventaId: movimientoEntity.ventaId,
        cantidad: movimientoEntity.cantidad,
        descripcion: movimientoEntity.descripcion,
        tipo: movimientoEntity.tipo,
        registroFecha: movimientoEntity.registroFecha,
        statusSincronizacion: movimientoEntity.statusSincronizacion,
        // Información del producto desde el LEFT JOIN
        productoNombre: productoEntity?.nombre,
        productoSku: productoEntity?.sku,
      );
    }).toList();
  }

  // Método para sincronizar un movimiento desde el API
  Future<void> upsertMovimiento(movimiento_model.InventarioMovimiento movimiento) async {
    final companion = InventarioMovimientosCompanion(
      inventarioMovimientoId: Value(movimiento.inventarioMovimientoId ?? const Uuid().v4()),
      productoId: Value(movimiento.productoId ?? ''),
      ventaId: Value(movimiento.ventaId),
      cantidad: Value(movimiento.cantidad ?? 0),
      descripcion: Value(movimiento.descripcion ?? ''),
      tipo: Value(movimiento.tipo ?? ''),
      registroFecha: Value(movimiento.registroFecha ?? DateTime.now()),
      statusSincronizacion: const Value(StatusConsts.sincronizado),
    );
    await db.into(db.inventarioMovimientos).insertOnConflictUpdate(companion);
  }

  // Método para obtener un movimiento específico con información del producto
  Future<movimiento_model.InventarioMovimiento> obtenerMovimiento({required String movimientoId}) async {
    // Query con LEFT JOIN para obtener un movimiento específico con información del producto
    final query = db.select(db.inventarioMovimientos).join([
      leftOuterJoin(db.productos, db.productos.uuid.equalsExp(db.inventarioMovimientos.productoId))
    ])..where(db.inventarioMovimientos.inventarioMovimientoId.equals(movimientoId));

    final result = await query.getSingle();
    final movimientoEntity = result.readTable(db.inventarioMovimientos);
    final productoEntity = result.readTableOrNull(db.productos);

    return movimiento_model.InventarioMovimiento(
      inventarioMovimientoId: movimientoEntity.inventarioMovimientoId,
      productoId: movimientoEntity.productoId,
      ventaId: movimientoEntity.ventaId,
      cantidad: movimientoEntity.cantidad,
      descripcion: movimientoEntity.descripcion,
      tipo: movimientoEntity.tipo,
      registroFecha: movimientoEntity.registroFecha,
      statusSincronizacion: movimientoEntity.statusSincronizacion,
      // Información del producto desde el LEFT JOIN
      productoNombre: productoEntity?.nombre,
      productoSku: productoEntity?.sku,
    );
  }
}
