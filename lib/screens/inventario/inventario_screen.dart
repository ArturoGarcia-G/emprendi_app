import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/controllers/inventario_movimiento_controller.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/screens/inventario/widgets/card_inventario_movimiento.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InventarioScreen extends StatefulWidget {
  const InventarioScreen({super.key});

  @override
  State<InventarioScreen> createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  final storage = GetStorage();
  final inventarioController = Get.find<InventarioMovimientoController>();
  final productoController = Get.find<ProductoController>();
  
  String? productoSeleccionado;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      productoController.listarProductos();
      inventarioController.listarMovimientos();
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
                Text('Movimientos de Inventario', style: textTheme.bodyLarge),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Dropdown para filtrar por producto
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(() {
                final productos = productoController.productos;
                
                return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: productoSeleccionado,
                    hint: const Text('Filtrar por producto'),
                    isExpanded: true,
                    items: [
                      const DropdownMenuItem<String>(
                        value: null,
                        child: Text('Todos los productos'),
                      ),
                      ...productos.map((producto) {
                        return DropdownMenuItem<String>(
                          value: producto.productoId,
                          child: Text(producto.nombre ?? 'Sin nombre'),
                        );
                      }).toList(),
                    ],
                    onChanged: (String? value) {
                      setState(() {
                        productoSeleccionado = value;
                      });
                      inventarioController.filtrarPorProducto(value);
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                final movimientos = inventarioController.movimientos;

                if (inventarioController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (movimientos.isEmpty) {
                  return const Center(
                    child: Text('No hay movimientos de inventario disponibles'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await inventarioController.listarMovimientos();
                  },
                  child: ListView.separated(
                    itemCount: movimientos.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final movimiento = movimientos[index];
                      return CardInventarioMovimiento(
                        movimiento: movimiento,
                      );
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
