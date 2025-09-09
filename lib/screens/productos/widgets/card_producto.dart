import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: colorScheme.secondary,
                ),
                child: Text('A1'),
              ),
              Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      producto.nombre ?? '',
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface,
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
                          '${producto.precio}',
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
                  Container(),
                  Row(
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: colorScheme.onSurface,
                        size: 20,
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
