import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/screens/productos/widgets/card_producto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductosScreen extends StatelessWidget {
  final storage = GetStorage();
  final productoController = Get.find<ProductoController>();

  ProductosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PrimaryAppBar(avatarUrl: ''),
      drawer: PrimaryDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Productos', style: textTheme.bodyLarge),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<List<Producto>>(
                future: productoController.listarProductos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final productos = snapshot.data ?? [];

                  if (productos.isEmpty) {
                    return const Center(
                      child: Text('No hay productos disponibles'),
                    );
                  }
                  return ListView.separated(
                    itemCount: productos.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final producto = productos[index];
                      return CardProducto(producto: producto);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
