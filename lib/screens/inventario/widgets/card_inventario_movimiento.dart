import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/inventario_movimiento.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class CardInventarioMovimiento extends StatelessWidget {
  final InventarioMovimiento movimiento;

  const CardInventarioMovimiento({super.key, required this.movimiento});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    // Determinar color del tipo de movimiento
    Color tipoColor = colorScheme.primary;
    IconData tipoIcon = Icons.swap_horiz;
    
    switch (movimiento.tipo?.toLowerCase()) {
      case 'entrada':
      case 'alta':
      case 'ajuste_positivo':
        tipoColor = colorVerde500;
        tipoIcon = Icons.add_circle_outline;
        break;
      case 'salida':
      case 'venta':
      case 'baja':
      case 'ajuste_negativo':
        tipoColor = colorRojo500;
        tipoIcon = Icons.remove_circle_outline;
        break;
      default:
        tipoColor = colorScheme.primary;
        tipoIcon = Icons.swap_horiz;
    }

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: Row(
            children: [
              // Icono del tipo de movimiento
              Container(
                decoration: BoxDecoration(
                  color: tipoColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  tipoIcon,
                  color: tipoColor,
                  size: 20,
                ),
              ),
              const Gap(12),
              // Información del movimiento
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movimiento.productoNombre ?? 'Producto no encontrado',
                      style: textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(2),
                    Text(
                      'SKU: ${movimiento.productoSku ?? 'N/A'}',
                      style: textTheme.bodySmall!.copyWith(
                        color: colorGris,
                        fontSize: 12,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      movimiento.descripcion ?? 'Sin descripción',
                      style: textTheme.bodySmall!.copyWith(
                        color: colorGris600,
                        fontSize: 11,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Información de cantidad y fecha
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Tipo y cantidad
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: tipoColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${movimiento.tipo?.toUpperCase() ?? 'N/A'} ${movimiento.cantidad ?? 0}',
                      style: textTheme.bodySmall!.copyWith(
                        color: tipoColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const Gap(4),
                  // Fecha
                  Text(
                    movimiento.registroFecha != null
                        ? dateFormat.format(movimiento.registroFecha!)
                        : '--',
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
    );
  }
}