import 'package:emprendi_app/models/cliente.dart';

import 'api_handler.dart';

class ClienteApi {
  final ApiHandler _apiHandler;

  ClienteApi(this._apiHandler);

  // Agregar un nuevo cliente
  Future<void> agregarCliente({
    required String telefono,
    required String nombre,
    required String clienteId,
  }) async {
    try {
      await _apiHandler.post('clientes', '', {
        'clienteId': clienteId,
        'telefono': telefono,
        'nombre': nombre,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Listar clientes
  Future<List<Cliente>> listarClientes({
    Map<String, dynamic>? filtros,
  }) async {
    try {
      final response = await _apiHandler.get('clientes', '', filtros ?? {});

      final List<dynamic> data = response['data'];

      return data.map((json) => Cliente.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Listar clientes
  Future<Cliente> obtenerCliente({
    required String clienteId,
  }) async {
    try {
      final response = await _apiHandler.get('clientes', clienteId, {});

      final Map<String, dynamic> data = response;

      return Cliente.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  // Editar un cliente
  Future<void> editarCliente({
    required String clienteId,
    required String telefono,
    required String nombre,
  }) async {
    try {
      await _apiHandler.patch('clientes', clienteId, {
        'clienteId': clienteId,
        'telefono': telefono,
        'nombre': nombre,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Editar un cliente
  Future<void> eliminarCliente({required String clienteId}) async {
    try {
      await _apiHandler.delete('clientes', clienteId, {});
    } catch (e) {
      rethrow;
    }
  }
}
