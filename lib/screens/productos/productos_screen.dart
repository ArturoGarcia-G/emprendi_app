import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/screens/productos/widgets/card_producto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  final storage = GetStorage();

  final productoController = Get.find<ProductoController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      productoController.listarProductos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const PrimaryAppBar(avatarUrl: ''),
      drawer: const PrimaryDrawer(),
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
              child: Obx(() {
                final productos = productoController.productos;

                if (productoController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (productos.isEmpty) {
                  return const Center(
                    child: Text('No hay productos disponibles'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await productoController.listarProductos();
                  },
                  child: ListView.separated(
                    itemCount: productos.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final producto = productos[index];
                      return CardProducto(producto: producto);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
