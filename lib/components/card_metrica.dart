import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class CardMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icon;

  const CardMetrica({
    super.key,
    required this.titulo,
    required this.valor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    //Tema
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: textTheme.bodyMedium!.copyWith(color: gris),
                ),
                Text(
                  valor,
                  style: textTheme.titleLarge!.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            Icon(icon, size: 28, color: colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
