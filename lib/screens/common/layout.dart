import 'package:emprendi_app/screens/home/home_screen.dart';
import 'package:emprendi_app/screens/inventario/inventario_screen.dart';
import 'package:emprendi_app/screens/productos/productos_screen.dart';
import 'package:emprendi_app/screens/ventas/ventas_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Layout extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController();

  Layout({super.key});

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      VentasScreen(),
      InventarioScreen(),
      ProductosScreen(),
      ProductosScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    final bottomNavigationBarTheme = Theme.of(context).bottomNavigationBarTheme;

    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: 'Inicio',
        activeColorPrimary: bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: bottomNavigationBarTheme.unselectedItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        title: 'Ventas',
        activeColorPrimary: bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: bottomNavigationBarTheme.unselectedItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.inventory_outlined),
        title: 'Inventario',
        activeColorPrimary: bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: bottomNavigationBarTheme.unselectedItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.category_outlined),
        title: 'Productos',
        activeColorPrimary: bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: bottomNavigationBarTheme.unselectedItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.more_horiz_outlined),
        title: 'Más',
        activeColorPrimary: bottomNavigationBarTheme.selectedItemColor!,
        inactiveColorPrimary: bottomNavigationBarTheme.unselectedItemColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Tema actual
    final bottomNavigationBarTheme = Theme.of(context).bottomNavigationBarTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      navBarHeight: 70,
      backgroundColor:
          bottomNavigationBarTheme.backgroundColor!,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(16),
        colorBehindNavBar: Theme.of(context).scaffoldBackgroundColor,
        border: Border(top: BorderSide(color: colorScheme.outline))
      ),
      navBarStyle: NavBarStyle.style9,
      padding: EdgeInsets.all(8),
    );
  }
}
