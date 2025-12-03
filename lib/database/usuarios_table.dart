import 'package:drift/drift.dart';

@DataClassName('UsuarioEntity')
class Usuarios extends Table {
  TextColumn get usuarioId => text()();
  TextColumn get nombreCompleto => text()();
  TextColumn get usuario => text()();
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
  Set<Column> get primaryKey => {usuarioId};
}