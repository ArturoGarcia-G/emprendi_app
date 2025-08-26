import 'api_handler.dart';
import '../models/usuario.dart';

class AuthApi {
  final ApiHandler _apiHandler;

  AuthApi(this._apiHandler);

  Future<Map<String, dynamic>> iniciarSesion({
    required String pin,
    required String usuario,
    required String password,
  }) async {
    try {
      final response = await _apiHandler.post('auth', 'login', {
        'pin': pin,
        'usuario': usuario,
        'password': password,
      });

      // response['usuario'] y response['access_token'] vienen del API de Laravel
      final Usuario user = Usuario.fromJson(response['usuario']);
      final String token = response['access_token'];

      return {'usuario': user, 'access_token': token};
    } catch (e) {
      rethrow;
    }
  }
}
