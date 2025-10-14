import 'package:drift/drift.dart';

@DataClassName('ClienteEntity')
class Clientes extends Table {
  TextColumn get clienteId => text()();
  TextColumn get telefono => text()();
  TextColumn get nombre => text()();
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
  Set<Column> get primaryKey => {clienteId};
}
