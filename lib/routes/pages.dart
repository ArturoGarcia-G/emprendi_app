import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/screens/common/layout.dart';
import 'package:emprendi_app/screens/login/login_screen.dart';
import 'package:emprendi_app/screens/productos/agregar_producto_screen.dart';
import 'package:emprendi_app/screens/productos/editar_producto_screen.dart';
import 'package:emprendi_app/screens/productos/producto_detalle_screen.dart';
import 'package:emprendi_app/screens/splash_screen.dart';
import 'package:get/route_manager.dart';
import './pages_routes.dart';

final List<GetPage> pages = <GetPage>[
  //Se definen rutas comunes
  GetPage(name: PagesRoutes.splashScreen, page: () => SplashScreen()),
  GetPage(name: PagesRoutes.loginScreen, page: () => LoginScreen()),
  GetPage(name: PagesRoutes.layoutScreen, page: () => Layout()),

  //Productos
  GetPage(
    name: PagesRoutes.agregarProductoScreen,
    page: () => AgregarProductoScreen(),
    transition: Transition.downToUp,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: PagesRoutes.editarProductoScreen,
    page: () {
      final producto = Get.arguments as Producto;
      return EditarProductoScreen(productoEditar: producto);
    },
    transition: Transition.downToUp,
    transitionDuration: Duration(milliseconds: 300),
  ),
  GetPage(
    name: PagesRoutes.productoDetalleScreen,
    page: () {
      final producto = Get.arguments as Producto;
      return ProductoDetalleScreen(producto: producto);
    },
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 300),
  ),
];
