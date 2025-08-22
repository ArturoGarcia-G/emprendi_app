import 'package:dio/dio.dart' as dio;
import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:get/get.dart';
import '../core/themes/color_palette.dart';

class ApiHandler {
  final dio.Dio _dio;

  ApiHandler({required String baseUrl})
    : _dio = dio.Dio(
        dio.BaseOptions(
          baseUrl: baseUrl,
          contentType: dio.Headers.jsonContentType,
        ),
      );

  Future<Map<String, dynamic>> get(
    String modulo,
    String endpoint,
    Map<String, dynamic> filtros,
  ) async {
    try {
      String urlModulo = endpoint.isEmpty ? modulo : '$modulo/$endpoint';
      final response = await _dio.get('/$urlModulo', queryParameters: filtros);
      return _parseResponse(response);
    } on dio.DioException catch (e) {
      _handleDioError(e);
      rethrow;
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
    } on dio.DioException catch (e) {
      _handleDioError(e);
      rethrow;
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

  /// Parseo de la respuesta cruda y manejo de errores
  Map<String, dynamic> _parseResponse(dio.Response response) {
    final extractedData = response.data;
    if (extractedData == null) {
      SnackbarHelper.show('No se recibió información del servidor');
      throw Exception('No data received');
    }

    final codigo = int.parse(extractedData['codigo'].toString());
    if (codigo > 200) {
      final mensaje = extractedData['mensaje'] ?? 'Error desconocido';
      SnackbarHelper.show(mensaje);
      throw Exception(mensaje);
    }

    // Retornamos la data cruda para que el Controller decida cómo convertirla
    final data = extractedData['data'];
    if (data is Map<String, dynamic>) {
      return data;
    } else {
      // Si es otro tipo (lista, string, etc.), lo devolvemos dentro de un Map
      return {'raw': data};
    }
  }

  void _handleDioError(dio.DioException e) {
    final statusCode = e.response?.statusCode ?? 0;
    final mensaje =
        e.response?.data?['mensaje'] ?? 'Error de red: ${e.message}';

    Get.snackbar(
      'Error $statusCode: $mensaje',
      e.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: colorRojo50,
      colorText: colorRojo500,
    );
  }
}
