import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/core/utils/texto_utils.dart';
import 'package:flutter/material.dart';

class StatusGlobal extends StatelessWidget {
  final String status;

  const StatusGlobal({super.key, required this.status});

  // Catálogo de status con colores
  static final Map<String, Map<String, Color>> _statusColors = {
    'success': {
      'background': colorVerde900,
      'foreground': colorVerde200,
    },
    'warning': {
      'background': Colors.orange.shade900,
      'foreground': Colors.orange.shade100,
    },
    'error': {
      'background': Colors.red.shade900,
      'foreground': Colors.red.shade100,
    },
    'info': {
      'background': Colors.blue.shade900,
      'foreground': Colors.blue.shade100,
    },
  };

  static final Map<String, String> _statusCategory = {
    'sincronizado': 'success',
    'activo': 'success',
    'pendiente': 'warning',
    'en_proceso': 'warning',
    'eliminado': 'error',
    'cancelado': 'error',
    'borrador': 'info',
    'archivado': 'info',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final normalized = status.toLowerCase();
    final category = _statusCategory[normalized] ?? 'info';
    final colors = _statusColors[category]!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors['background'],
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      child: Text(
        TextoUtils.capitalizar(status),
        style: theme.textTheme.labelSmall!.copyWith(
          color: colors['foreground'],
        ),
      ),
    );
  }
}
