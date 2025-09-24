import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

enum BotonTipo { primario, secundario, outline, eliminar }

class BotonBase extends StatelessWidget {
  final String label;
  final VoidCallback fn;
  final bool isLoading;
  final BotonTipo tipo;

  const BotonBase({
    super.key,
    required this.label,
    required this.fn,
    this.isLoading = false,
    this.tipo = BotonTipo.primario,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Definir estilo según tipo
    ButtonStyle style;
    switch (tipo) {
      case BotonTipo.primario:
        style = ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        );
        break;
      case BotonTipo.secundario:
        style = ElevatedButton.styleFrom(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.outline),
        );
        break;
      case BotonTipo.outline:
        style = ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          elevation: 0,
        );
        break;
      case BotonTipo.eliminar:
        style = ElevatedButton.styleFrom(
          backgroundColor: colorRojo900,
          foregroundColor: colorBlanco,
        );
        break;
    }

    return ElevatedButton(
      onPressed: isLoading ? null : fn,
      style: style,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  tipo == BotonTipo.outline
                      ? colorScheme.primary
                      : colorScheme.onPrimary,
                ),
              ),
            )
          : Text(label),
    );
  }
}
