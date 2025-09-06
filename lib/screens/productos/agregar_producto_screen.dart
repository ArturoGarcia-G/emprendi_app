import 'package:emprendi_app/components/boton_base.dart';
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: SecundaryAppBar(titulo: 'Agregar producto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildCard(
                  textTheme,
                  'Información básica',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre del producto'),
                      Gap(4),
                      InputBase(
                        controller: nombreCtrl,
                        placeholder: 'Ej: Botella de vidrio',
                        requerido: true,
                      ),
                      Gap(12),
                      Text('Clave/SKU'),
                      Gap(4),
                      InputBase(
                        controller: skuCtrl,
                        placeholder: 'Ej: BV-0123',
                      ),
                    ],
                  ),
                ),
                Gap(16),
                _buildCard(
                  textTheme,
                  'Precios y costos',
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Costo'),
                            Gap(4),
                            InputBase(
                              controller: costoCtrl,
                              placeholder: '0.00',
                              keyboardType: TextInputType.number,
                              requerido: true,
                            ),
                          ],
                        ),
                      ),
                      Gap(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Precio'),
                            Gap(4),
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
                Gap(16),
                _buildCard(
                  textTheme,
                  'Inventario',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stock inicial'),
                      Gap(4),
                      InputBase(
                        controller: stockCtrl,
                        placeholder: '0',
                        keyboardType: TextInputType.number,
                        requerido: true,
                      ),
                    ],
                  ),
                ),
                Gap(24),
                Row(
                  children: [
                    Expanded(
                      child: BotonBase(
                        label: 'Cancelar',
                        fn: () => Get.back(),
                        tipo: BotonTipo.secundario,
                      ),
                    ),
                    Gap(8),
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

  Widget _buildCard(TextTheme textTheme, String titulo, Widget child) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: textTheme.bodyMedium),
              Gap(12),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
