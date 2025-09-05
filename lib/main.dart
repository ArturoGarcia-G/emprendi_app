import 'dart:io';
import 'package:emprendi_app/controllers/theme_controller.dart';
import 'package:emprendi_app/screens/common/custom_error_screen.dart';
import 'package:emprendi_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'core/utils/custom_http_overrides.dart';
import 'package:intl/date_symbol_data_local.dart';
import './routes/pages.dart';
import './routes/pages_routes.dart';
import './core/helpers/app_binding.dart';
import './core/themes/app_theme.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();
void main() async {
  //await dotenv.load();
  await GetStorage.init();
  //Se define horientación horizontal
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  initializeDateFormatting();

  //Se define estilo para la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.grey[400], // status bar color
    ),
  );
  HttpOverrides.global = CustomHttpoverrides();
  runApp(const EmprendiApp());
}

class EmprendiApp extends StatelessWidget {
  const EmprendiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (themeController) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          initialBinding: BindingsBuilder(AppBinding.bindingControllers),
          defaultTransition: Transition.rightToLeft,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode:
              themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          builder: (BuildContext context, Widget? widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
                CustomErrorScreen(errorDetails: errorDetails);

            return Overlay(
              key: overlayKey,
              initialEntries: [OverlayEntry(builder: (context) => widget!)],
            );
          },
          getPages: pages,
          routingCallback: (routing) =>
              PagesRoutes.fnRoutingCallback(routing!),
        );
      },
    );
  }
}
