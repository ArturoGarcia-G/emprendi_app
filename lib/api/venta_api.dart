import 'package:emprendi_app/models/venta.dart';

import 'api_handler.dart';

class VentaApi {
  final ApiHandler _apiHandler;

  VentaApi(this._apiHandler);

  // Listar ventas
  Future<List<Venta>> listarVentas({Map<String, dynamic>? filtros}) async {
    try {
      final response = await _apiHandler.get('ventas', '', filtros ?? {});

      final List<dynamic> data = response['data'];

      return data.map((json) => Venta.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Obtener venta
  Future<Venta> obtenerVenta({required String ventaId}) async {
    try {
      final response = await _apiHandler.get('ventas', ventaId, {});

      final Map<String, dynamic> data = response;

      return Venta.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  // Agregar venta
  Future<void> agregarVenta({
    required String clienteId,
    required String ventaId,
    required double total,
    required List<Map<String, dynamic>> detalles,
  }) async {
    try {
      final data = {
        'clienteId': clienteId,
        'ventaId': ventaId,
        'total': total,
        'detalles': detalles,
      };

      await _apiHandler.post('ventas', '', data);
    } catch (e) {
      rethrow;
    }
  }
}
