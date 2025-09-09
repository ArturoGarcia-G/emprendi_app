import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:get/get.dart';
import '../api/producto_api.dart';

class ProductoController extends GetxController {
  ProductoController();

  final ProductoApi productoApi = Get.find<ProductoApi>();
  var isLoading = false.obs;

  // Método para crear un producto
  Future<void> agregarProducto({
    required String sku,
    required String nombre,
    required int stock,
    required double precio,
    required double costo,
  }) async {
    try {
      isLoading.value = true;

      await productoApi.agregarProducto(
        sku: sku,
        nombre: nombre,
        stock: stock,
        precio: precio,
        costo: costo,
      );

      // Aquí decides qué hacer después de crear el producto
      SnackbarHelper.show(
        'Producto creado exitosamente',
        type: SnackbarType.success,
      );

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Método para listar productos
  Future<List<Producto>> listarProductos({Map<String, dynamic>? filtros}) async {
    try {
      isLoading.value = true;

      final productosList = await productoApi.listarProductos(filtros: filtros);

      return productosList;
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
