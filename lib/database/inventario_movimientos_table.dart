import 'package:drift/drift.dart';

@DataClassName('InventarioMovimientoEntity')
class InventarioMovimientos extends Table {
  TextColumn get inventarioMovimientoId => text()();
  TextColumn get productoId => text()();
  TextColumn get ventaId => text().nullable()();
  IntColumn get cantidad => integer()();
  TextColumn get descripcion => text()();
  TextColumn get tipo => text()();
  DateTimeColumn get registroFecha =>
      dateTime().withDefault(currentDateAndTime)();
  // Para manejar sincronización
  TextColumn get statusSincronizacion =>
      text().withDefault(const Constant('creacion_pendiente'))();

  @override
  Set<Column> get primaryKey => {inventarioMovimientoId};
}
