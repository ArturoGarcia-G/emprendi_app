import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/models/venta.dart' as model;
import 'package:emprendi_app/models/venta_detalle.dart' as detalle_model;

class VentaLocalRepository {
  final AppDatabase db;
  VentaLocalRepository(this.db);

  Future<List<model.Venta>> listarVentas() async {
    // Query con LEFT JOIN a la tabla clientes
    final query = db.select(db.ventas).join([
      leftOuterJoin(db.clientes, db.clientes.clienteId.equalsExp(db.ventas.clienteId))
    ]);

    final results = await query.get();

    // Mapeamos los resultados incluyendo información del cliente
    return results.map((row) {
      final ventaEntity = row.readTable(db.ventas);
      final clienteEntity = row.readTableOrNull(db.clientes);

      return model.Venta(
        ventaId: ventaEntity.ventaId,
        clienteId: ventaEntity.clienteId,
        negocioId: ventaEntity.negocioId,
        total: ventaEntity.total,
        folio: ventaEntity.folio,
        status: ventaEntity.status,
        registroFecha: ventaEntity.registroFecha,
        registroAutorId: ventaEntity.registroAutorId,
        actualizacionFecha: ventaEntity.actualizacionFecha,
        actualizacionAutorId: ventaEntity.actualizacionAutorId,
        statusSincronizacion: ventaEntity.statusSincronizacion,
        // Información del cliente desde el LEFT JOIN
        clienteNombre: clienteEntity?.nombre,
        clienteTelefono: clienteEntity?.telefono,
      );
    }).toList();
  }

  Future<model.Venta> obtenerVenta({required String ventaId}) async {
    // Query con LEFT JOIN para obtener una venta específica con información del cliente
    final query = db.select(db.ventas).join([
      leftOuterJoin(db.clientes, db.clientes.clienteId.equalsExp(db.ventas.clienteId))
    ])..where(db.ventas.ventaId.equals(ventaId));

    final result = await query.getSingle();
    final ventaEntity = result.readTable(db.ventas);
    final clienteEntity = result.readTableOrNull(db.clientes);

    // Mapeamos VentaEntity a Venta incluyendo información del cliente
    return model.Venta(
      ventaId: ventaEntity.ventaId,
      clienteId: ventaEntity.clienteId,
      negocioId: ventaEntity.negocioId,
      total: ventaEntity.total,
      folio: ventaEntity.folio,
      status: ventaEntity.status,
      registroFecha: ventaEntity.registroFecha,
      registroAutorId: ventaEntity.registroAutorId,
      actualizacionFecha: ventaEntity.actualizacionFecha,
      actualizacionAutorId: ventaEntity.actualizacionAutorId,
      statusSincronizacion: ventaEntity.statusSincronizacion,
      // Información del cliente desde el LEFT JOIN
      clienteNombre: clienteEntity?.nombre,
      clienteTelefono: clienteEntity?.telefono,
    );
  }

  Future<void> upsertVenta(model.Venta v) async {
    final companion = VentasCompanion(
      ventaId: Value(v.ventaId ?? const Uuid().v4()),
      clienteId: Value(v.clienteId ?? ''),
      negocioId: Value(v.negocioId),
      total: Value(v.total ?? 0.0),
      folio: Value(v.folio),
      status: Value(v.status ?? 'activa'),
      registroFecha: Value(v.registroFecha ?? DateTime.now()),
      registroAutorId: Value(v.registroAutorId),
      actualizacionFecha: Value(v.actualizacionFecha),
      actualizacionAutorId: Value(v.actualizacionAutorId),
      statusSincronizacion: const Value(StatusConsts.sincronizado),
    );
    await db.into(db.ventas).insertOnConflictUpdate(companion);
  }

  // Crear nueva venta con detalles
  Future<model.Venta> agregarVenta({
    required String clienteId,
    String? negocioId,
    required double total,
    required List<detalle_model.VentaDetalle> detalles,
    String? registroAutorId,
  }) async {
    return await db.transaction(() async {
      // Crear la venta
      final ventaId = const Uuid().v4();
      final now = DateTime.now();
      
      final ventaCompanion = VentasCompanion(
        ventaId: Value(ventaId),
        clienteId: Value(clienteId),
        negocioId: Value(negocioId),
        total: Value(total),
        status: const Value('activa'),
        registroFecha: Value(now),
        registroAutorId: Value(registroAutorId),
        statusSincronizacion: const Value(StatusConsts.creacionPendiente),
      );
      
      await db.into(db.ventas).insert(ventaCompanion);

      // Crear los detalles de la venta
      for (var detalle in detalles) {
        final detalleCompanion = VentasDetalleCompanion(
          ventaDetalleId: Value(const Uuid().v4()),
          ventaId: Value(ventaId),
          negocioId: Value(negocioId ?? ''),
          productoId: Value(detalle.productoId ?? ''),
          precioUnitario: Value(detalle.precioUnitario ?? 0.0),
          cantidad: Value(detalle.cantidad ?? 0),
          subtotal: Value(detalle.subtotal ?? 0.0),
          registroFecha: Value(now),
          registroAutorId: Value(registroAutorId ?? ''),
          statusSincronizacion: const Value(StatusConsts.creacionPendiente),
        );
        
        await db.into(db.ventasDetalle).insert(detalleCompanion);
      }

      // Retornar la venta creada
      return model.Venta(
        ventaId: ventaId,
        clienteId: clienteId,
        negocioId: negocioId,
        total: total,
        status: 'activa',
        registroFecha: now,
        registroAutorId: registroAutorId,
        statusSincronizacion: StatusConsts.creacionPendiente,
      );
    });
  }

  // Actualizar estado de sincronización
  Future<void> actualizarSincronizacion(model.Venta venta) async {
    await (db.update(db.ventas)..where((v) => v.ventaId.equals(venta.ventaId!)))
        .write(const VentasCompanion(
      statusSincronizacion: Value(StatusConsts.sincronizado),
    ));
  }
}