import 'package:emprendi_app/models/inventario_movimiento.dart';
import 'api_handler.dart';

class InventarioApi {
  final ApiHandler _apiHandler;

  InventarioApi(this._apiHandler);

  // Agregar un nuevo ajuste de stock
  Future<void> agregarMovimientoInventario({
    String? ventaId,
    required String productoId,
    required int cantidad,
    required String descripcion,
    required String tipo,
    required String inventarioMovimientoId,
  }) async {
    try {
      await _apiHandler.post('inventario-movimientos', '', {
        'productoId': productoId,
        'inventarioMovimientoId': inventarioMovimientoId,
        'ventaId': ventaId,
        'cantidad': cantidad,
        'descripcion': descripcion,
        'tipo': tipo,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Listar movimientos de inventario
  Future<List<InventarioMovimiento>> listarMovimientos({
    Map<String, dynamic>? filtros,
  }) async {
    try {
      final response = await _apiHandler.get('inventario-movimientos', '', filtros ?? {});

      final List<dynamic> data = response['data'];

      return data.map((json) => InventarioMovimiento.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Obtener un movimiento específico
  Future<InventarioMovimiento> obtenerMovimiento({
    required String movimientoId,
  }) async {
    try {
      final response = await _apiHandler.get('inventario-movimientos', movimientoId, {});

      final Map<String, dynamic> data = response;

      return InventarioMovimiento.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
