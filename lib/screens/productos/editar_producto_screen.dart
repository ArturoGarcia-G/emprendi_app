import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/components/secundary_app_bar.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EditarProductoScreen extends StatefulWidget {
  final Producto productoEditar;
  const EditarProductoScreen({super.key, required this.productoEditar});

  @override
  State<EditarProductoScreen> createState() => _EditarProductoScreenState();
}

class _EditarProductoScreenState extends State<EditarProductoScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nombreCtrl;
  late final TextEditingController skuCtrl;
  late final TextEditingController precioCtrl;
  late final TextEditingController costoCtrl;

  final productoController = Get.find<ProductoController>();

  @override
  void initState() {
    super.initState();
    // Inicializamos los controllers con los valores actuales del producto
    nombreCtrl = TextEditingController(text: widget.productoEditar.nombre);
    skuCtrl = TextEditingController(text: widget.productoEditar.sku);
    precioCtrl = TextEditingController(
      text: widget.productoEditar.precio?.toString() ?? '0',
    );
    costoCtrl = TextEditingController(
      text: widget.productoEditar.costo?.toString() ?? '0',
    );
  }

  @override
  void dispose() {
    nombreCtrl.dispose();
    skuCtrl.dispose();
    precioCtrl.dispose();
    costoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecundaryAppBar(titulo: 'Editar producto'),
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
                          label: 'Guardar cambios',
                          isLoading: productoController.isLoading.value,
                          fn: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              productoController.editarProducto(
                                productoId: widget.productoEditar.productoId!,
                                sku: skuCtrl.text,
                                nombre: nombreCtrl.text,
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
}
