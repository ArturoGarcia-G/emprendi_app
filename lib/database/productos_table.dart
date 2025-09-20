import 'package:drift/drift.dart';

@DataClassName('ProductoEntity')
class Productos extends Table {
  TextColumn get uuid => text()(); // PK local
  TextColumn get sku => text()();
  TextColumn get nombre => text()();
  IntColumn get stock => integer()();
  RealColumn get precio => real()();
  RealColumn get costo => real()();
  TextColumn get status =>
      text().withDefault(const Constant('activo'))();
   DateTimeColumn get registroFecha => dateTime()
      .withDefault(currentDateAndTime)();
  DateTimeColumn get actualizacionFecha => dateTime()
      .nullable()();

  // Para manejar sincronización
  TextColumn get statusSincronizacion =>
      text().withDefault(const Constant('creacion_pendiente'))();

  @override
  Set<Column> get primaryKey => {uuid};
}
