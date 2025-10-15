import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/models/cliente.dart';
import 'package:emprendi_app/repositories/cliente_local_repository.dart';
import 'package:get/get.dart';
import '../api/cliente_api.dart';

class ClienteController extends GetxController {
  ClienteController();

  final ClienteApi clienteApi = Get.find<ClienteApi>();
  var isLoading = false.obs;
  var clientes = <Cliente>[].obs;

  // Método para crear un cliente
  Future<void> agregarCliente({
    required String telefono,
    required String nombre,
  }) async {
    try {
      isLoading.value = true;

      // Guardar offline en SQLite
      final clienteLocalRepo = ClienteLocalRepository(AppDatabase());
      final clienteLocal = await clienteLocalRepo.agregarCliente(
        telefono: telefono,
        nombre: nombre,
      );

      // Intentar mandar al servidor
      try {
        await clienteApi.agregarCliente(
          clienteId: clienteLocal.clienteId.value,
          telefono: telefono,
          nombre: nombre,
        );

        await clienteLocalRepo.actualizarSincronizacion(clienteLocal);
      } catch (_) {}

      SnackbarHelper.show(
        'Cliente creado correctamente',
        type: SnackbarType.success,
      );

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Método para listar clientes
  Future<void> listarClientes({Map<String, dynamic>? filtros}) async {
    try {
      isLoading.value = true;

      final localRepo = ClienteLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final clientesApi = await clienteApi.listarClientes(
          filtros: filtros,
        );
        for (var p in clientesApi) {
          await localRepo.upsertCliente(p);
        }
      } catch (_) {}
      clientes.value = await localRepo.listarClientes();
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para listar clientes
  Future<Cliente> obtenerCliente({required String clienteId}) async {
    try {
      final localRepo = ClienteLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final registroClientesApi = await clienteApi.obtenerCliente(
          clienteId: clienteId,
        );

        await localRepo.upsertCliente(registroClientesApi);
      } catch (error) {
        rethrow;
      }
      final cliente = await localRepo.obtenerCliente(clienteId: clienteId);
      return cliente;
    } catch (e) {
      rethrow;
    }
  }

  // Método para editar un cliente
  Future<void> editarCliente({
    required String clienteId,
    required String telefono,
    required String nombre,
    required double precio,
    required double costo,
  }) async {
    try {
      isLoading.value = true;

      // Guardar offline en SQLite
      final clienteLocalRepo = ClienteLocalRepository(AppDatabase());
      final clienteLocal = await clienteLocalRepo.editarCliente(
        clienteId: clienteId,
        telefono: telefono,
        nombre: nombre,
      );

      // Intentar mandar al servidor
      try {
        await clienteApi.editarCliente(
          clienteId: clienteLocal.clienteId.value,
          telefono: telefono,
          nombre: nombre,
        );

        await clienteLocalRepo.actualizarSincronizacion(clienteLocal);
      } catch (_) {}

      SnackbarHelper.show(
        'Cliente editado correctamente',
        type: SnackbarType.success,
      );

      listarClientes();

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Método para eliminar un cliente
  Future<void> eliminarCliente({required String clienteId}) async {
    try {
      // Intentar mandar al servidor
      await clienteApi.eliminarCliente(clienteId: clienteId);

      SnackbarHelper.show(
        'Cliente eliminado correctamente',
        type: SnackbarType.success,
      );

      listarClientes();

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    }
  }
}
