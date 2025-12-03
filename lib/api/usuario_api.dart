import 'package:emprendi_app/models/usuario.dart';

import 'api_handler.dart';

class UsuarioApi {
  final ApiHandler _apiHandler;

  UsuarioApi(this._apiHandler);

  // Agregar un nuevo usuario
  Future<void> agregarUsuario({
    required String nombreCompleto,
    required String usuario,
    required String password,
    required String usuarioId,
  }) async {
    try {
      await _apiHandler.post('usuarios', '', {
        'usuarioId': usuarioId,
        'nombreCompleto': nombreCompleto,
        'usuario': usuario,
        'password': password,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Listar usuarios
  Future<List<Usuario>> listarUsuarios({
    Map<String, dynamic>? filtros,
  }) async {
    try {
      final response = await _apiHandler.get('usuarios', '', filtros ?? {});

      final List<dynamic> data = response['data'];

      return data.map((json) => Usuario.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Obtener usuario
  Future<Usuario> obtenerUsuario({
    required String usuarioId,
  }) async {
    try {
      final response = await _apiHandler.get('usuarios', usuarioId, {});

      final Map<String, dynamic> data = response;

      return Usuario.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  // Editar un usuario
  Future<void> editarUsuario({
    required String usuarioId,
    required String nombreCompleto,
    required String usuario,
  }) async {
    try {
      await _apiHandler.patch('usuarios', usuarioId, {
        'usuarioId': usuarioId,
        'nombreCompleto': nombreCompleto,
        'usuario': usuario,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Eliminar un usuario
  Future<void> eliminarUsuario({required String usuarioId}) async {
    try {
      await _apiHandler.delete('usuarios', usuarioId, {});
    } catch (e) {
      rethrow;
    }
  }
}