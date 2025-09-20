import 'package:emprendi_app/api/api_handler.dart';
import 'package:emprendi_app/api/auth_api.dart';
import 'package:emprendi_app/api/producto_api.dart';
import 'package:emprendi_app/controllers/auth_controller.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/controllers/theme_controller.dart';
import 'package:emprendi_app/database/app_database.dart';
import 'package:emprendi_app/services/sync_service.dart';
import 'package:get/get.dart';

class AppBinding {
  //En este metodo se definen todos los controller para ser inicializados
  static void bindingControllers() {
    //Tema
    Get.put(ThemeController(), permanent: true);

    // Servicios / API handlers
    Get.put(
      ApiHandler(baseUrl: 'http://192.168.100.25:8080/api'),
      permanent: true,
    );
    Get.put(AuthApi(Get.find<ApiHandler>()), permanent: true);
    Get.put(ProductoApi(Get.find<ApiHandler>()), permanent: true);

    // Base de datos local (Drift)
    final db = AppDatabase();
    Get.put(db, permanent: true);

    // Servicio de sincronización
    final syncService = SyncService(
      db: db,
      productoApi: Get.find<ProductoApi>(),
    );
    Get.put(syncService, permanent: true);

    // Iniciamos la sincronización automática
    syncService.startAutoSync();

    // Controllers
    Get.put(AuthController(), permanent: true);
    Get.put(ProductoController(), permanent: true);
  }
}
