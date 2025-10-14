import 'package:emprendi_app/models/producto.dart';

import 'api_handler.dart';

class ProductoApi {
  final ApiHandler _apiHandler;

  ProductoApi(this._apiHandler);

  // Agregar un nuevo producto
  Future<void> agregarProducto({
    required String sku,
    required String nombre,
    required int stock,
    required double precio,
    required double costo,
    required String productoId,
  }) async {
    try {
      await _apiHandler.post('productos', '', {
        'productoId': productoId,
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

  // Listar productos
  Future<List<Producto>> listarProductos({
    Map<String, dynamic>? filtros,
  }) async {
    try {
      final response = await _apiHandler.get('productos', '', filtros ?? {});

      final List<dynamic> data = response['data'];

      return data.map((json) => Producto.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // Listar productos
  Future<Producto> obtenerProducto({
    required String productoId,
  }) async {
    try {
      final response = await _apiHandler.get('productos', productoId, {});

      final Map<String, dynamic> data = response;

      return Producto.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  // Editar un producto
  Future<void> editarProducto({
    required String productoId,
    required String sku,
    required String nombre,
    required double precio,
    required double costo,
  }) async {
    try {
      await _apiHandler.patch('productos', productoId, {
        'productoId': productoId,
        'sku': sku,
        'nombre': nombre,
        'precio': precio,
        'costo': costo,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Editar un producto
  Future<void> eliminarProducto({required String productoId}) async {
    try {
      await _apiHandler.delete('productos', productoId, {});
    } catch (e) {
      rethrow;
    }
  }
}
