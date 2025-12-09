import 'package:drift/drift.dart';

@DataClassName('VentaDetalleEntity')
class VentasDetalle extends Table {
  TextColumn get ventaDetalleId => text()();
  TextColumn get ventaId => text()();
  TextColumn get negocioId => text()();
  TextColumn get productoId => text()();
  RealColumn get precioUnitario => real()();
  IntColumn get cantidad => integer()();
  RealColumn get subtotal => real()();
  DateTimeColumn get registroFecha => dateTime()
      .withDefault(currentDateAndTime)();
  TextColumn get registroAutorId => text()();
  DateTimeColumn get actualizacionFecha => dateTime()
      .nullable()();
  TextColumn get actualizacionAutorId => text().nullable()();

  // Para manejar sincronización
  TextColumn get statusSincronizacion =>
      text().withDefault(const Constant('creacion_pendiente'))();

  @override
  Set<Column> get primaryKey => {ventaDetalleId};
}