import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/models/usuario.dart' as model;

class UsuarioLocalRepository {
  final AppDatabase db;
  UsuarioLocalRepository(this.db);

  Future<UsuariosCompanion> agregarUsuario({
    required String nombreCompleto,
    required String usuario,
  }) async {
    final usuarioId = const Uuid().v4();
    final usuarioCompanion = UsuariosCompanion.insert(
      usuarioId: usuarioId,
      nombreCompleto: nombreCompleto,
      usuario: usuario,
      status: const Value('activo'),
      statusSincronizacion: const Value('creacion_pendiente'),
    );

    await db.into(db.usuarios).insert(usuarioCompanion);

    return usuarioCompanion;
  }

  Future<List<model.Usuario>> listarUsuarios() async {
    final entities = await db.select(db.usuarios).get();

    // Mapeamos UsuarioEntity a Usuario
    return entities
        .map(
          (entity) => model.Usuario(
            usuarioId: entity.usuarioId,
            nombreCompleto: entity.nombreCompleto,
            usuario: entity.usuario,
            status: entity.status,
            registroFecha: entity.registroFecha,
            actualizacionFecha: entity.actualizacionFecha,
            statusSincronizacion: entity.statusSincronizacion,
          ),
        )
        .toList();
  }

  Future<model.Usuario> obtenerUsuario({required String usuarioId}) async {
    final entity = await (db.select(
      db.usuarios,
    )..where((usuarios) => usuarios.usuarioId.equals(usuarioId))).getSingle();

    // Mapeamos UsuarioEntity a Usuario
    return model.Usuario(
      usuarioId: entity.usuarioId,
      nombreCompleto: entity.nombreCompleto,
      usuario: entity.usuario,
      status: entity.status,
      registroFecha: entity.registroFecha,
      actualizacionFecha: entity.actualizacionFecha,
      statusSincronizacion: entity.statusSincronizacion,
    );
  }

  Future<void> upsertUsuario(model.Usuario u) async {
    final companion = UsuariosCompanion(
      usuarioId: Value(u.usuarioId ?? const Uuid().v4()),
      nombreCompleto: Value(u.nombreCompleto ?? ''),
      usuario: Value(u.usuario ?? ''),
      status: Value(u.status ?? 'activo'),
      registroFecha: Value(u.registroFecha ?? DateTime.now()),
      actualizacionFecha: Value(u.actualizacionFecha),
      statusSincronizacion: const Value(StatusConsts.sincronizado),
    );
    await db.into(db.usuarios).insertOnConflictUpdate(companion);
  }

  Future<void> actualizarSincronizacion(UsuariosCompanion usuario) async {
    await db
        .update(db.usuarios)
        .replace(
          usuario.copyWith(
            statusSincronizacion: const Value(StatusConsts.sincronizado),
          ),
        );
  }

  Future<UsuariosCompanion> editarUsuario({
    required String usuarioId,
    String? nombreCompleto,
    String? usuario,
  }) async {
    // Obtener el usuario existente
    final usuarioExistente = await (db.select(
      db.usuarios,
    )..where((t) => t.usuarioId.equals(usuarioId))).getSingle();

    // Crear un companion con los cambios
    final usuarioActualizado = UsuariosCompanion(
      usuarioId: Value(usuarioId), // primary key
      nombreCompleto: nombreCompleto != null
          ? Value(nombreCompleto)
          : Value(usuarioExistente.nombreCompleto),
      usuario: usuario != null ? Value(usuario) : Value(usuarioExistente.usuario),
      statusSincronizacion: const Value('actualizacion_pendiente'),
    );

    // Actualizar la fila en SQLite
    await db.update(db.usuarios).replace(usuarioActualizado);

    return usuarioActualizado;
  }
}