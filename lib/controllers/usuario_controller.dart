import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/models/usuario.dart';
import 'package:emprendi_app/repositories/usuario_local_repository.dart';
import 'package:get/get.dart';
import '../api/usuario_api.dart';

class UsuarioController extends GetxController {
  UsuarioController();

  final UsuarioApi usuarioApi = Get.find<UsuarioApi>();
  var isLoading = false.obs;
  var usuarios = <Usuario>[].obs;

  // Método para crear un usuario
  Future<bool> agregarUsuario({
    required String nombreCompleto,
    required String usuario,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      // Guardar offline en SQLite
      final usuarioLocalRepo = UsuarioLocalRepository(AppDatabase());
      final usuarioLocal = await usuarioLocalRepo.agregarUsuario(
        nombreCompleto: nombreCompleto,
        usuario: usuario,
      );

      // Intentar mandar al servidor
      try {
        await usuarioApi.agregarUsuario(
          usuarioId: usuarioLocal.usuarioId.value,
          nombreCompleto: nombreCompleto,
          usuario: usuario,
          password: password,
        );

        await usuarioLocalRepo.actualizarSincronizacion(usuarioLocal);
      } catch (_) {}

      SnackbarHelper.show(
        'Usuario creado correctamente',
        type: SnackbarType.success,
      );

      return true;
    } catch (e) {
      SnackbarHelper.show(e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para listar usuarios
  Future<void> listarUsuarios({Map<String, dynamic>? filtros}) async {
    try {
      isLoading.value = true;

      final localRepo = UsuarioLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final usuariosApi = await usuarioApi.listarUsuarios(
          filtros: filtros,
        );
        for (var u in usuariosApi) {
          await localRepo.upsertUsuario(u);
        }
      } catch (_) {}
      usuarios.value = await localRepo.listarUsuarios();
    } catch (e) {
      SnackbarHelper.show(e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  // Método para obtener un usuario
  Future<Usuario> obtenerUsuario({required String usuarioId}) async {
    try {
      final localRepo = UsuarioLocalRepository(AppDatabase());

      try {
        // Intentamos traer del API y guardamos si el listado es exitoso
        final registroUsuarioApi = await usuarioApi.obtenerUsuario(
          usuarioId: usuarioId,
        );

        await localRepo.upsertUsuario(registroUsuarioApi);
      } catch (error) {
        rethrow;
      }
      final usuario = await localRepo.obtenerUsuario(usuarioId: usuarioId);
      return usuario;
    } catch (e) {
      rethrow;
    }
  }

  // Método para editar un usuario
  Future<void> editarUsuario({
    required String usuarioId,
    required String nombreCompleto,
    required String usuario,
  }) async {
    try {
      isLoading.value = true;

      // Guardar offline en SQLite
      final usuarioLocalRepo = UsuarioLocalRepository(AppDatabase());
      final usuarioLocal = await usuarioLocalRepo.editarUsuario(
        usuarioId: usuarioId,
        nombreCompleto: nombreCompleto,
        usuario: usuario,
      );

      // Intentar mandar al servidor
      try {
        await usuarioApi.editarUsuario(
          usuarioId: usuarioLocal.usuarioId.value,
          nombreCompleto: nombreCompleto,
          usuario: usuario,
        );

        await usuarioLocalRepo.actualizarSincronizacion(usuarioLocal);
      } catch (_) {}

      SnackbarHelper.show(
        'Usuario editado correctamente',
        type: SnackbarType.success,
      );

      listarUsuarios();

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Método para eliminar un usuario
  Future<void> eliminarUsuario({required String usuarioId}) async {
    try {
      // Intentar mandar al servidor
      await usuarioApi.eliminarUsuario(usuarioId: usuarioId);

      SnackbarHelper.show(
        'Usuario eliminado correctamente',
        type: SnackbarType.success,
      );

      listarUsuarios();

      Get.back();
    } catch (e) {
      SnackbarHelper.show(e.toString());
    }
  }
}