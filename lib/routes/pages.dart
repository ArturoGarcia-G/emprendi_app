import 'package:emprendi_app/screens/home/home_screen.dart';
import 'package:emprendi_app/screens/login/login_screen.dart';
import 'package:emprendi_app/screens/splash_screen.dart';
import 'package:get/route_manager.dart';
import './pages_routes.dart';

final List<GetPage> pages = <GetPage>[
  //Se definen rutas comunes
  GetPage(name: PagesRoutes.splashScreen, page: () => SplashScreen()),
  GetPage(name: PagesRoutes.loginScreen, page: () => LoginScreen()),
  GetPage(name: PagesRoutes.homeScreen, page: () => HomeScreen()),
];
