import 'package:emprendi_app/components/modales/modal_eliminar.dart';
import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/controllers/producto_controller.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/core/utils/number_utils.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardProducto extends StatelessWidget {
  final Producto producto;

  const CardProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final productoController = Get.find<ProductoController>();

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.secondary,
                  ),
                  child: const Text('A1'),
                ),
                onTap: () => Get.toNamed(
                  PagesRoutes.productoDetalleScreen,
                  arguments: producto,
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(
                        PagesRoutes.productoDetalleScreen,
                        arguments: producto,
                      ),
                      child: Row(
                        children: [
                          Text(
                            producto.nombre ?? '',
                            style: textTheme.bodyMedium!.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const Gap(4),
                          producto.statusSincronizacion ==
                                  StatusConsts.sincronizado
                              ? const Icon(
                                  Icons.cloud_done_outlined,
                                  color: colorVerde500,
                                  size: 14,
                                )
                              : const Icon(
                                  Icons.cloud_sync_outlined,
                                  color: colorGris600,
                                  size: 14,
                                ),
                        ],
                      ),
                    ),
                    const Gap(2),
                    Text(
                      'SKU: ${producto.sku}',
                      style: textTheme.bodySmall!.copyWith(color: colorGris),
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Text(
                          NumberUtils.formatMoney(producto.precio ?? 0),
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          'Stock: ${producto.stock}',
                          style: textTheme.bodySmall!.copyWith(
                            color: colorGris,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  StatusGlobal(status: producto.status ?? ''),
                  const Gap(16),
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.edit_outlined,
                          color: colorScheme.onSurface,
                          size: 20,
                        ),
                        onTap: () => Get.toNamed(
                          PagesRoutes.editarProductoScreen,
                          arguments: producto,
                        ),
                      ),
                      const Gap(10),
                      GestureDetector(
                        child: const Icon(
                          Icons.delete_outline,
                          color: colorRojo900,
                          size: 20,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return ModalEliminar(
                                tipoRegistro: 'producto',
                                nombreRegistro: producto.nombre ?? '',
                                textoAdvertencia:
                                    'Se eliminara el producto y no podrás volverlo a usar en ningun proceso del sistema',
                                onEliminar: () async {
                                  await productoController.eliminarProducto(
                                    productoId: producto.productoId!,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
