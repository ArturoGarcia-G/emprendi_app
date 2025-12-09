import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/venta.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardVenta extends StatelessWidget {
  final Venta venta;

  const CardVenta({super.key, required this.venta});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            PagesRoutes.ventaDetalleScreen,
            arguments: venta.ventaId,
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(6),
                child: Icon(
                  Icons.receipt_long_outlined,
                  color: colorScheme.onPrimaryContainer,
                  size: 20,
                ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          venta.clienteNombre ?? '--',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Gap(4),
                        venta.statusSincronizacion == StatusConsts.sincronizado
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
                    const Gap(2),
                    Text(
                      'Total: \$${venta.total?.toStringAsFixed(2) ?? '0.00'}',
                      style: textTheme.bodySmall!.copyWith(
                        color: colorGris,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  StatusGlobal(status: venta.status ?? ''),
                  const Gap(4),
                  Text(
                    '${venta.registroFecha.toString().substring(8, 10)}/${venta.registroFecha.toString().substring(5, 7)}/${venta.registroFecha.toString().substring(0, 4)}',
                    style: textTheme.bodySmall!.copyWith(
                      color: colorGris,
                      fontSize: 10,
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
