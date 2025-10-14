import 'package:emprendi_app/models/producto.dart';

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
}
