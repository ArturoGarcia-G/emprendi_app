import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/repositories/producto_local_repository.dart';
import 'package:get/get.dart';
import '../api/producto_api.dart';

class ProductoController extends GetxController {
  ProductoController();

  final ProductoApi productoApi = Get.find<ProductoApi>();
  var isLoading = false.obs;
  var productos = <Producto>[].obs;

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

      // Guardar offline en SQLite
      final productoLocalRepo = ProductoLocalRepository(AppDatabase());
      final productoLocal = await productoLocalRepo.agregarProducto(
        sku: sku,
        nombre: nombre,
        stock: stock,
        precio: precio,
        costo: costo,
      );

      // Intentar mandar al servidor
      try {
        await productoApi.agregarProducto(
          productoId: productoLocal.uuid.value,
          sku: sku,
          nombre: nombre,
          stock: stock,
          precio: precio,
          costo: costo,
        );

        await productoLocalRepo.actualizarSincronizacion(productoLocal);
      } catch (_) {}

      SnackbarHelper.show(
        'Producto creado correctamente',
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
  Future<void> listarProductos({
    Map<String, dynamic>? filtros,
  }) async {
    try {
      isLoading.value = true;

      final localRepo = ProductoLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final productosApi = await productoApi.listarProductos(
          filtros: filtros,
        );
        for (var p in productosApi) {
          await localRepo.upsertProducto(p);
        }
      } catch (_) {}
      productos.value = await localRepo.listarProductos();
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para crear un producto
  Future<void> editarProducto({
    required String productoId,
    required String sku,
    required String nombre,
    required double precio,
    required double costo,
  }) async {
    try {
      isLoading.value = true;

      // Guardar offline en SQLite
      final productoLocalRepo = ProductoLocalRepository(AppDatabase());
      final productoLocal = await productoLocalRepo.editarProducto(
        uuid: productoId,
        sku: sku,
        nombre: nombre,
        precio: precio,
        costo: costo,
      );

      // Intentar mandar al servidor
      try {
        await productoApi.editarProducto(
          productoId: productoLocal.uuid.value,
          sku: sku,
          nombre: nombre,
          precio: precio,
          costo: costo,
        );

        await productoLocalRepo.actualizarSincronizacion(productoLocal);
      } catch (_) {}

      SnackbarHelper.show(
        'Producto editado correctamente',
        type: SnackbarType.success,
      );

      listarProductos();

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
