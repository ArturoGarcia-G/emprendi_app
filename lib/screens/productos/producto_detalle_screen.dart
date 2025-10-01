import 'package:emprendi_app/components/banner_status_sincronizacion.dart';
import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/secundary_app_bar.dart';
import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/core/utils/number_utils.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:emprendi_app/screens/productos/modales/modal_ajustar_stock.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductoDetalleScreen extends StatelessWidget {
  final Producto producto;
  ProductoDetalleScreen({super.key, required this.producto});

  final productoController = Get.find<ProductoController>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final dateFormat = DateFormat('d MMM yyyy HH:mm', 'es_MX');
    return Scaffold(
      appBar: const SecundaryAppBar(titulo: 'Detalle del producto'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CardBase(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: colorScheme.secondary,
                            ),
                            child: const Text('A1'),
                          ),
                          const Gap(8),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          producto.nombre ?? '',
                                          style: textTheme.titleMedium,
                                        ),
                                        const Gap(4),
                                        Text(
                                          'SKU: ${producto.sku}',
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: gris,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    StatusGlobal(status: producto.status ?? ''),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Precio de venta',
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: gris,
                                          ),
                                        ),
                                        Text(
                                          NumberUtils.formatMoney(
                                            producto.precio ?? 0,
                                          ),
                                          style: textTheme.titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: colorScheme.primary,
                                              ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stock actual',
                                          style: textTheme.bodyMedium!.copyWith(
                                            color: gris,
                                          ),
                                        ),
                                        Text(
                                          NumberUtils.formatNumber(
                                            producto.stock ?? 0,
                                            decimales: 0,
                                          ),
                                          style: textTheme.titleMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    CardBase(
                      icono: Icons.trending_up_outlined,
                      titulo: 'Información financiera',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Costo por unidad',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text(
                                        NumberUtils.formatMoney(
                                          producto.costo ?? 0,
                                        ),
                                        style: textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Precio',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text(
                                        NumberUtils.formatMoney(
                                          producto.precio ?? 0,
                                        ),
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Magen de ganancia',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text('750'), //TODO: Actualizar monto
                                    ],
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Valor total en stock',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text('750'), //TODO: Actualizar monto
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    CardBase(
                      icono: Icons.cloud_outlined,
                      titulo: 'Estado de sincronización',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BannerStatusSincronizacion(
                            status: producto.statusSincronizacion ?? '',
                          ),
                          const Gap(12),
                          Row(
                            children: [
                              Text(
                                'Última sincronización',
                                style: textTheme.bodySmall!.copyWith(
                                  color: gris,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '28 ene 2024, 10:30',
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(16),
                    CardBase(
                      icono: Icons.person_4_outlined,
                      titulo: 'Información de registro',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Creado por',
                                style: textTheme.bodySmall!.copyWith(
                                  color: gris,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                'Admin',
                                style: textTheme.bodySmall,
                              ), //TODO: Actualizar a creador
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Fecha de creación',
                                style: textTheme.bodySmall!.copyWith(
                                  color: gris,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                producto.registroFecha == null
                                    ? '--'
                                    : dateFormat.format(
                                        producto.registroFecha!,
                                      ),
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Última actualización',
                                style: textTheme.bodySmall!.copyWith(
                                  color: gris,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                producto.actualizacionFecha == null
                                    ? '--'
                                    : dateFormat.format(
                                        producto.actualizacionFecha!,
                                      ),
                                style: textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                  ],
                ),
              ),
            ),
            const Gap(8),
            Row(
              children: [
                Expanded(
                  child: BotonBase(
                    label: 'Ajustar stock', //TODO: Agregar icono
                    fn: () {
                      showModalBottomSheet(
                        context: context,
                        useRootNavigator: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) {
                          return ModalAjustarStock(
                            producto: producto,
                            fnAjuste: () async {
                              await productoController.eliminarProducto(
                                productoId: producto.productoId!,
                              );
                            },
                          );
                        },
                      );
                    },
                    tipo: BotonTipo.secundario,
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: BotonBase(
                    label: 'Editar', //TODO: Agregar icono
                    fn: () => Get.toNamed(
                      PagesRoutes.editarProductoScreen,
                      arguments: producto,
                    ),
                    tipo: BotonTipo.secundario,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
