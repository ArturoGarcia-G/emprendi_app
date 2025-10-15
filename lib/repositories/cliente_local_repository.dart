import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/models/cliente.dart' as model;

class ClienteLocalRepository {
  final AppDatabase db;
  ClienteLocalRepository(this.db);

  Future<ClientesCompanion> agregarCliente({
    required String telefono,
    required String nombre,

  }) async {
    final clienteId = const Uuid().v4();
    final cliente = ClientesCompanion.insert(
      clienteId: clienteId,
      telefono: telefono,
      nombre: nombre,
      status: const Value('activo'),
      statusSincronizacion: const Value('creacion_pendiente'),
    );

    await db.into(db.clientes).insert(cliente);

    return cliente;
  }

  Future<List<model.Cliente>> listarClientes() async {
    final entities = await db.select(db.clientes).get();

    // Mapeamos ClienteEntity a Cliente
    return entities
        .map(
          (entity) => model.Cliente(
            clienteId: entity.clienteId,
            telefono: entity.telefono,
            nombre: entity.nombre,
            status: entity.status,
            registroFecha: entity.registroFecha,
            actualizacionFecha: entity.actualizacionFecha,
            statusSincronizacion: entity.statusSincronizacion,
          ),
        )
        .toList();
  }

  Future<model.Cliente> obtenerCliente({required String clienteId}) async {
    final entity = await (db.select(
      db.clientes,
    )..where((clientes) => clientes.clienteId.equals(clienteId))).getSingle();

    // Mapeamos ClienteEntity a Cliente
    return model.Cliente(
      clienteId: entity.clienteId,
      telefono: entity.telefono,
      nombre: entity.nombre,
      status: entity.status,
      registroFecha: entity.registroFecha,
      actualizacionFecha: entity.actualizacionFecha,
      statusSincronizacion: entity.statusSincronizacion,
    );
  }

  Future<void> upsertCliente(model.Cliente p) async {
    final companion = ClientesCompanion(
      clienteId: Value(p.clienteId ?? const Uuid().v4()),
      telefono: Value(p.telefono ?? ''),
      nombre: Value(p.nombre ?? ''),
      status: Value(p.status ?? 'activo'),
      registroFecha: Value(p.registroFecha ?? DateTime.now()),
      actualizacionFecha: Value(p.registroFecha),
      statusSincronizacion: const Value(StatusConsts.sincronizado),
    );
    await db.into(db.clientes).insertOnConflictUpdate(companion);
  }

  Future<void> actualizarSincronizacion(ClientesCompanion cliente) async {
    await db
        .update(db.clientes)
        .replace(
          cliente.copyWith(
            statusSincronizacion: const Value(StatusConsts.sincronizado),
          ),
        );
  }

  Future<ClientesCompanion> editarCliente({
    required String clienteId,
    String? telefono,
    String? nombre,
  }) async {
    // Obtener el cliente existente
    final clienteExistente = await (db.select(
      db.clientes,
    )..where((t) => t.clienteId.equals(clienteId))).getSingle();

    // Crear un companion con los cambios
    final clienteActualizado = ClientesCompanion(
      clienteId: Value(clienteId), // primary key
      telefono: telefono != null
          ? Value(telefono)
          : Value(clienteExistente.telefono),
      nombre: nombre != null ? Value(nombre) : Value(clienteExistente.nombre),
      statusSincronizacion: const Value('actualizacion_pendiente'),
    );

    // Actualizar la fila en SQLite
    await db.update(db.clientes).replace(clienteActualizado);

    return clienteActualizado;
  }
}
