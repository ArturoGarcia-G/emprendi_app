import 'package:emprendi_app/api/auth_api.dart';
import 'package:emprendi_app/models/usuario.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/pages_routes.dart';

class AuthController extends GetxController {
  final storage = GetStorage();
  final AuthApi authApi = Get.find<AuthApi>();
  final Rx<Usuario?> _usuario = Rx<Usuario?>(null);
  Usuario? get usuario => _usuario.value;

  @override
  void onInit() {
    super.onInit();
    _checkAuth();
  }

  void setUsuario(Usuario user) {
    _usuario.value = user;
  }

  void _checkAuth() async {
    await Future.delayed(Duration(seconds: 2)); // Simula splash

    String? token = storage.read('token');
    final storedUser = storage.read('usuario');

    if (storedUser != null) {
      _usuario.value = Usuario.fromJson(Map<String, dynamic>.from(storedUser));
    }

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(PagesRoutes.homeScreen);
    } else {
      Get.offAllNamed(PagesRoutes.loginScreen);
    }
  }

  // Método para iniciar sesión
  Future<void> iniciarSesion({
    required String pin,
    required String usuario,
    required String password,
  }) async {
    if (pin.isEmpty || usuario.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Todos los campos son obligatorios',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final response = await authApi.iniciarSesion(
      pin: pin,
      usuario: usuario,
      password: password,
    );

    final Usuario user = response['usuario'];
    final String token = response['access_token'];

    _usuario.value = user;

    final usuarioJson = user.toJson();
    storage.write('usuario', usuarioJson);
    storage.write('token', token);
    Get.offAllNamed('/home');
  }
}
