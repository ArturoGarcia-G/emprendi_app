import 'package:emprendi_app/api/inventario_api.dart';
import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/models/inventario_movimiento.dart';
import 'package:emprendi_app/repositories/inventario_movimiento_local_repo.dart';
import 'package:get/get.dart';

class InventarioMovimientoController extends GetxController {
  InventarioMovimientoController();

  final InventarioApi inventarioApi = Get.find<InventarioApi>();
  var isLoading = false.obs;
  var movimientos = <InventarioMovimiento>[].obs;
  var todosLosMovimientos = <InventarioMovimiento>[].obs;
  String? productoFiltroId;

  // Método para listar movimientos de inventario
  Future<void> listarMovimientos({Map<String, dynamic>? filtros}) async {
    try {
      isLoading.value = true;

      final localRepo = InventarioMovimientoLocalRepo(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final movimientosApi = await inventarioApi.listarMovimientos(
          filtros: filtros,
        );
        for (var movimiento in movimientosApi) {
          await localRepo.upsertMovimiento(movimiento);
        }
      } catch (_) {
        // Si falla el API, continuamos con los datos locales
      }
      
      todosLosMovimientos.value = await localRepo.listarMovimientos();
      _aplicarFiltro();
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obtener un movimiento específico
  Future<InventarioMovimiento> obtenerMovimiento({required String movimientoId}) async {
    try {
      final localRepo = InventarioMovimientoLocalRepo(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el obtener es exitoso
        final registroMovimientoApi = await inventarioApi.obtenerMovimiento(
          movimientoId: movimientoId,
        );

        await localRepo.upsertMovimiento(registroMovimientoApi);
      } catch (error) {
        // Si falla el API, continuamos con los datos locales
      }
      
      final movimiento = await localRepo.obtenerMovimiento(movimientoId: movimientoId);
      return movimiento;
    } catch (e) {
      rethrow;
    }
  }

  // Método para filtrar por producto
  void filtrarPorProducto(String? productoId) {
    productoFiltroId = productoId;
    _aplicarFiltro();
  }

  // Método privado para aplicar el filtro actual
  void _aplicarFiltro() {
    if (productoFiltroId == null || productoFiltroId!.isEmpty) {
      // Si no hay filtro, mostrar todos los movimientos
      movimientos.value = List.from(todosLosMovimientos);
    } else {
      // Filtrar por productoId
      movimientos.value = todosLosMovimientos
          .where((movimiento) => movimiento.productoId == productoFiltroId)
          .toList();
    }
  }
}