import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/models/venta.dart';
import 'package:emprendi_app/models/venta_detalle.dart';
import 'package:emprendi_app/repositories/venta_local_repository.dart';
import 'package:get/get.dart';
import '../api/venta_api.dart';

class VentaController extends GetxController {
  VentaController();

  final VentaApi ventaApi = Get.find<VentaApi>();
  var isLoading = false.obs;
  var ventas = <Venta>[].obs;

  // Método para listar ventas
  Future<void> listarVentas({Map<String, dynamic>? filtros}) async {
    try {
      isLoading.value = true;

      final localRepo = VentaLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final ventasApi = await ventaApi.listarVentas(filtros: filtros);
        for (var v in ventasApi) {
          await localRepo.upsertVenta(v);
        }
      } catch (_) {}
      ventas.value = await localRepo.listarVentas();
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obtener una venta
  Future<Venta> obtenerVenta({required String ventaId}) async {
    try {
      final localRepo = VentaLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final registroVentaApi = await ventaApi.obtenerVenta(ventaId: ventaId);

        await localRepo.upsertVenta(registroVentaApi);
      } catch (error) {
        rethrow;
      }
      final venta = await localRepo.obtenerVenta(ventaId: ventaId);
      return venta;
    } catch (e) {
      rethrow;
    }
  }

  // Método para agregar una venta
  Future<void> agregarVenta({
    required String clienteId,
    String? negocioId,
    String? formaPago,
    required List<Map<String, dynamic>> productos,
    String? registroAutorId,
  }) async {
    try {
      isLoading.value = true;

      final localRepo = VentaLocalRepository(AppDatabase());

      // Calcular total y crear detalles
      double total = 0.0;
      List<VentaDetalle> detalles = [];

      for (var producto in productos) {
        final precioUnitario = (producto['precioUnitario'] as num).toDouble();
        final cantidad = producto['cantidad'] as int;
        final subtotal = precioUnitario * cantidad;

        total += subtotal;

        detalles.add(
          VentaDetalle(
            productoId: producto['productoId'],
            precioUnitario: precioUnitario,
            cantidad: cantidad,
            subtotal: subtotal,
          ),
        );
      }

      // Guardar offline en SQLite
      final ventaLocal = await localRepo.agregarVenta(
        clienteId: clienteId,
        negocioId: negocioId,
        total: total,
        detalles: detalles,
        registroAutorId: registroAutorId,
      );

      // Intentar mandar al servidor
      try {
        final detallesApi = detalles
            .map(
              (detalle) => {
                'productoId': detalle.productoId,
                'precioUnitario': detalle.precioUnitario,
                'cantidad': detalle.cantidad,
                'subtotal': detalle.subtotal,
              },
            )
            .toList();

        await ventaApi.agregarVenta(
          clienteId: clienteId,
          ventaId: ventaLocal.ventaId!,
          total: total,
          detalles: detallesApi,
        );

        await localRepo.actualizarSincronizacion(ventaLocal);
      } catch (_) {
        // Si falla el API, se queda como pendiente de sincronización
      }

      SnackbarHelper.show(
        'Venta registrada correctamente',
        type: SnackbarType.success,
      );

      // Actualizar la lista de ventas
      await listarVentas();
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
