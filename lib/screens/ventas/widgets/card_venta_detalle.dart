import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/core/utils/number_utils.dart';
import 'package:emprendi_app/models/venta_detalle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardVentaDetalle extends StatelessWidget {
  final Map<String, dynamic> detalleConProducto;

  const CardVentaDetalle({super.key, required this.detalleConProducto});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final VentaDetalle detalle = detalleConProducto['detalle'];
    final Map<String, dynamic>? producto = detalleConProducto['producto'];

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto?['nombre'] ?? 'Producto no encontrado',
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Gap(4),
                  Row(
                    children: [
                      Text(
                        '${detalle.cantidad} x ${NumberUtils.formatMoney(detalle.precioUnitario!)}',
                        style: textTheme.bodySmall?.copyWith(color: colorGris),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Subtotal
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  NumberUtils.formatMoney(detalle.subtotal ?? 0),
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorVerde500,
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
