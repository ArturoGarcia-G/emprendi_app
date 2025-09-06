import 'api_handler.dart';

class ProductoApi {
  final ApiHandler _apiHandler;

  ProductoApi(this._apiHandler);

  /// Agregar un nuevo producto
  Future<void> agregarProducto({
    required String sku,
    required String nombre,
    required int stock,
    required double precio,
    required double costo,
  }) async {
    try {
      await _apiHandler.post('productos', '', {
        'sku': sku,
        'nombre': nombre,
        'stockInicial': stock,
        'precio': precio,
        'costo': costo,
      });

    } catch (e) {
      rethrow;
    }
  }
}
