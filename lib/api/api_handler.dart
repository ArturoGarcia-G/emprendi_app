import 'package:dio/dio.dart' as dio;
import 'package:emprendi_app/core/helpers/logger_helper.dart';
import 'package:get/get.dart';
import '../core/themes/color_palette.dart';
import 'package:get_storage/get_storage.dart';

class ApiHandler {
  final dio.Dio _dio;
  final GetStorage storage = GetStorage();

  ApiHandler({required String baseUrl})
    : _dio = dio.Dio(
        dio.BaseOptions(
          baseUrl: baseUrl,
          contentType: dio.Headers.jsonContentType,
        ),
      ) {
    _dio.interceptors.add(
      dio.InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = storage.read('token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get(
    String modulo,
    String endpoint,
    Map<String, dynamic> filtros,
  ) async {
    try {
      String urlModulo = endpoint.isEmpty ? modulo : '$modulo/$endpoint';
      final response = await _dio.get('/$urlModulo', queryParameters: filtros);
      return _parseResponse(response);
    } on dio.DioException catch (dioError) {
      // Manejo de errores específicos de Dio
      int statusCode = dioError.response?.statusCode ?? 0;

      if (dioError.response != null) {
        LoggerHelper.error('Respuesta del servidor con error:');
        LoggerHelper.error(
          'Código de estado: ${dioError.response?.statusCode}',
        );
        LoggerHelper.error('Mensaje: ${dioError.response?.statusMessage}');
      } else {
        LoggerHelper.error('Error de red: ${dioError.message}');
        statusCode = 551;
      }

      throw Exception(_obtenerMensajeError(statusCode.toString()));
    } catch (e) {
      Get.snackbar(
        'Error inesperado',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: colorRojo50,
        colorText: colorRojo500,
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String modulo,
    String endpoint,
    Map<String, dynamic> filtros, {
    bool isUpload = false,
  }) async {
    try {
      String urlModulo = endpoint.isEmpty ? modulo : '$modulo/$endpoint';
      final data = isUpload ? dio.FormData.fromMap(filtros) : filtros;
      final response = await _dio.post('/$urlModulo', data: data);
      return _parseResponse(response);
    } on dio.DioException catch (dioError) {
      // Manejo de errores específicos de Dio
      int statusCode = dioError.response?.statusCode ?? 0;

      if (dioError.response != null) {
        LoggerHelper.error('Respuesta del servidor con error:');
        LoggerHelper.error(
          'Código de estado: ${dioError.response?.statusCode}',
        );
        LoggerHelper.error('Mensaje: ${dioError.response?.statusMessage}');
      } else {
        LoggerHelper.error('Error de red: ${dioError.message}');
        statusCode = 551;
      }

      throw Exception(_obtenerMensajeError(statusCode.toString()));
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patch(
    String modulo,
    String endpoint,
    Map<String, dynamic> filtros, {
    bool isUpload = false,
  }) async {
    try {
      String urlModulo = endpoint.isEmpty ? modulo : '$modulo/$endpoint';
      final data = isUpload ? dio.FormData.fromMap(filtros) : filtros;
      final response = await _dio.patch('/$urlModulo', data: data);
      return _parseResponse(response);
    } on dio.DioException catch (dioError) {
      // Manejo de errores específicos de Dio
      int statusCode = dioError.response?.statusCode ?? 0;

      if (dioError.response != null) {
        LoggerHelper.error('Respuesta del servidor con error:');
        LoggerHelper.error(
          'Código de estado: ${dioError.response?.statusCode}',
        );
        LoggerHelper.error('Mensaje: ${dioError.response?.statusMessage}');
      } else {
        LoggerHelper.error('Error de red: ${dioError.message}');
        statusCode = 551;
      }

      throw Exception(_obtenerMensajeError(statusCode.toString()));
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(
    String modulo,
    String endpoint,
    Map<String, dynamic> filtros, {
    bool isUpload = false,
  }) async {
    try {
      String urlModulo = endpoint.isEmpty ? modulo : '$modulo/$endpoint';
      final data = isUpload ? dio.FormData.fromMap(filtros) : filtros;
      final response = await _dio.delete('/$urlModulo', data: data);
      return _parseResponse(response);
    } on dio.DioException catch (dioError) {
      // Manejo de errores específicos de Dio
      int statusCode = dioError.response?.statusCode ?? 0;

      if (dioError.response != null) {
        LoggerHelper.error('Respuesta del servidor con error:');
        LoggerHelper.error(
          'Código de estado: ${dioError.response?.statusCode}',
        );
        LoggerHelper.error('Mensaje: ${dioError.response?.statusMessage}');
      } else {
        LoggerHelper.error('Error de red: ${dioError.message}');
        statusCode = 551;
      }

      throw Exception(_obtenerMensajeError(statusCode.toString()));
    } catch (e) {
      rethrow;
    }
  }

  /// Parseo de la respuesta cruda y manejo de errores
  Map<String, dynamic> _parseResponse(dio.Response response) {
    final extractedData = response.data;
    if (extractedData == null) {
      throw Exception('No data received');
    }

    final codigo = int.parse(extractedData['codigo'].toString());
    if (codigo > 200) {
      final mensaje = extractedData['mensaje'] ?? 'Error desconocido';
      throw Exception(mensaje);
    }

    // Retornamos la data cruda para que el Controller decida cómo convertirla
    final data = extractedData['data'];
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      // Si es otro tipo (lista, string, etc.), lo devolvemos dentro de un Map
      return {'data': data};
    }
  }

  static String _obtenerMensajeError(String? status) {
    String mensaje = 'Codigo: $status';
    switch (status) {
      case '404':
        mensaje += ', Recurso no encontrado';
        break;
      case '401':
        mensaje += ', Sesión invalida o expirada';
        break;
      case '405':
        mensaje += ', Método no permitido';
        break;
      case '500':
        mensaje += ', Error interno de servidor';
        break;
      case '551':
        mensaje = 'Error de red, no se pudo establecer la conexión';
        break;
      default:
        mensaje += ', Ocurrio un error en la petición';
    }
    return mensaje;
  }
}
