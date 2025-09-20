import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/consts/status_consts.dart';
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

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme.secondary,
                  ),
                  child: Text('A1'),
                ),
                onTap: () => Get.toNamed(
                  PagesRoutes.productoDetalleScreen,
                  arguments: producto,
                ),
              ),
              Gap(12),
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
                          Gap(4),
                          producto.statusSincronizacion ==
                                  StatusConsts.sincronizado
                              ? Icon(
                                  Icons.cloud_done_outlined,
                                  color: colorVerde500,
                                  size: 14,
                                )
                              : Icon(
                                  Icons.cloud_sync_outlined,
                                  color: colorGris600,
                                  size: 14,
                                ),
                        ],
                      ),
                    ),
                    Gap(2),
                    Text(
                      'SKU: ${producto.sku}',
                      style: textTheme.bodySmall!.copyWith(color: colorGris),
                    ),
                    Gap(8),
                    Row(
                      children: [
                        Text(
                          NumberUtils.formatMoney(producto.precio ?? 0),
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                        Gap(8),
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
                  Gap(16),
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
                      Gap(10),
                      Icon(Icons.delete_outline, color: colorRojo800, size: 20),
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
