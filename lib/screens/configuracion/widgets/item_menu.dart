import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemMenu extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final IconData icono;
  final Color colorIcono;
  final Color backgroundIcono;

  const ItemMenu({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.icono,
    required this.colorIcono,
    required this.backgroundIcono,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    //final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundIcono,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              icono,
              color: colorIcono,
              size: 22,
            ),
          ),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo),
                Text(
                  subtitulo,
                  style: textTheme.bodySmall!.copyWith(color: gris),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }
}
