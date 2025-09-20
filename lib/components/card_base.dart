import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardBase extends StatelessWidget {
  final String? titulo;
  final Widget child;
  final IconData? icono;

  const CardBase({super.key, required this.child, this.titulo, this.icono});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Solo mostrar fila si hay titulo o icono
              if (titulo != null || icono != null)
                Row(
                  children: [
                    if (icono != null) ...[Icon(icono, size: 20), const Gap(8)],
                    if (titulo != null)
                      Text(titulo!, style: textTheme.bodyMedium),
                  ],
                ),
              // Solo agregar separación si hay titulo o icono
              if (titulo != null || icono != null) const Gap(12),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
