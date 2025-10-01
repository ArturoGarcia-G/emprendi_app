import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/components/secundary_app_bar.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AgregarProductoScreen extends StatelessWidget {
  AgregarProductoScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final nombreCtrl = TextEditingController();
  final skuCtrl = TextEditingController();
  final precioCtrl = TextEditingController();
  final costoCtrl = TextEditingController();
  final stockCtrl = TextEditingController();

  final productoController = Get.find<ProductoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecundaryAppBar(titulo: 'Agregar producto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CardBase(
                  titulo: 'Información básica',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Nombre del producto'),
                      const Gap(4),
                      InputBase(
                        controller: nombreCtrl,
                        placeholder: 'Ej: Botella de vidrio',
                        requerido: true,
                      ),
                      const Gap(12),
                      const Text('Clave/SKU'),
                      const Gap(4),
                      InputBase(
                        controller: skuCtrl,
                        placeholder: 'Ej: BV-0123',
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                CardBase(
                  titulo: 'Precios y costos',
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Costo'),
                            const Gap(4),
                            InputBase(
                              controller: costoCtrl,
                              placeholder: '0.00',
                              keyboardType: TextInputType.number,
                              requerido: true,
                            ),
                          ],
                        ),
                      ),
                      const Gap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Precio'),
                            const Gap(4),
                            InputBase(
                              controller: precioCtrl,
                              placeholder: '0.00',
                              keyboardType: TextInputType.number,
                              requerido: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                CardBase(
                  titulo: 'Inventario',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Stock inicial'),
                      const Gap(4),
                      InputBase(
                        controller: stockCtrl,
                        placeholder: '0',
                        keyboardType: TextInputType.number,
                        requerido: true,
                      ),
                    ],
                  ),
                ),
                const Gap(24),
                Row(
                  children: [
                    Expanded(
                      child: BotonBase(
                        label: 'Cancelar',
                        fn: () => Get.back(),
                        tipo: BotonTipo.secundario,
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Obx(
                        () => BotonBase(
                          label: 'Guardar producto',
                          isLoading: productoController.isLoading.value,
                          fn: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              productoController.agregarProducto(
                                sku: skuCtrl.text,
                                nombre: nombreCtrl.text,
                                stock: int.tryParse(stockCtrl.text) ?? 0,
                                precio: double.tryParse(precioCtrl.text) ?? 0.0,
                                costo: double.tryParse(costoCtrl.text) ?? 0.0,
                              );
                              productoController.listarProductos();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
