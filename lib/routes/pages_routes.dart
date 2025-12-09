import 'package:get/route_manager.dart';

class PagesRoutes {
  //Se define middleware para rutas con nombre
  static void fnRoutingCallback(Routing routing) {
    switch (routing.current) {
      case '/':
        break;
    }
  }

  //Se definen rutas
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const homeScreen = '/home';
  static const layoutScreen = '/layout';

  //Productos
  static const agregarProductoScreen = '/agregar-producto';
  static const editarProductoScreen = '/editar-producto';
  static const productoDetalleScreen = '/detalle-producto';

  //Clientes
  static const gestorClientesScreen = '/gestor-clientes';
  static const clienteDetalleScreen = '/detalle-cliente';

  //Usuarios
  static const gestorUsuariosScreen = '/gestor-usuarios';

  //Ventas
  static const agregarVentaScreen = '/agregar-venta';
  static const ventaDetalleScreen = '/detalle-venta';
}
