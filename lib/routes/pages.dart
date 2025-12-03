import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/screens/clientes/clientes_screen.dart';
import 'package:emprendi_app/screens/common/layout.dart';
import 'package:emprendi_app/screens/login/login_screen.dart';
import 'package:emprendi_app/screens/productos/agregar_producto_screen.dart';
import 'package:emprendi_app/screens/productos/cliente_detalle_screen.dart';
import 'package:emprendi_app/screens/productos/editar_producto_screen.dart';
import 'package:emprendi_app/screens/productos/producto_detalle_screen.dart';
import 'package:emprendi_app/screens/splash_screen.dart';
import 'package:emprendi_app/screens/usuarios/usuarios_screen.dart';
import 'package:get/route_manager.dart';
import './pages_routes.dart';

final List<GetPage> pages = <GetPage>[
  //Se definen rutas comunes
  GetPage(name: PagesRoutes.splashScreen, page: () => const SplashScreen()),
  GetPage(name: PagesRoutes.loginScreen, page: () => LoginScreen()),
  GetPage(name: PagesRoutes.layoutScreen, page: () => Layout()),

  //Productos
  GetPage(
    name: PagesRoutes.agregarProductoScreen,
    page: () => AgregarProductoScreen(),
    transition: Transition.downToUp,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: PagesRoutes.editarProductoScreen,
    page: () {
      final producto = Get.arguments as Producto;
      return EditarProductoScreen(productoEditar: producto);
    },
    transition: Transition.downToUp,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: PagesRoutes.productoDetalleScreen,
    page: () {
      final productoId = Get.arguments as String;
      return ProductoDetalleScreen(productoId: productoId);
    },
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  //Clientes
  GetPage(
    name: PagesRoutes.gestorClientesScreen,
    page: () {
      return const ClientesScreen();
    },
    transition: Transition.topLevel,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: PagesRoutes.clienteDetalleScreen,
    page: () {
      final clienteId = Get.arguments as String;
      return ClienteDetalleScreen(clienteId: clienteId);
    },
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),

  //Usuarios
  GetPage(
    name: PagesRoutes.gestorUsuariosScreen,
    page: () {
      return const UsuariosScreen();
    },
    transition: Transition.topLevel,
    transitionDuration: const Duration(milliseconds: 300),
  ),
];
