import 'package:drift/drift.dart';

@DataClassName('VentaEntity')
class Ventas extends Table {
  TextColumn get ventaId => text()();
  TextColumn get clienteId => text()();
  TextColumn get negocioId => text().nullable()();
  RealColumn get total => real()();
  IntColumn get folio => integer().nullable()();
  TextColumn get status =>
      text().withDefault(const Constant('activa'))();
  DateTimeColumn get registroFecha => dateTime()
      .withDefault(currentDateAndTime)();
  TextColumn get registroAutorId => text().nullable()();
  DateTimeColumn get actualizacionFecha => dateTime()
      .nullable()();
  TextColumn get actualizacionAutorId => text().nullable()();

  // Para manejar sincronización
  TextColumn get statusSincronizacion =>
      text().withDefault(const Constant('creacion_pendiente'))();

  @override
  Set<Column> get primaryKey => {ventaId};
}