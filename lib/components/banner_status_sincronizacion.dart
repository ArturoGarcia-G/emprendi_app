import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BannerStatusSincronizacion extends StatelessWidget {
  final String status;

  const BannerStatusSincronizacion({super.key, required this.status});

  // Catálogo de status con colores
  static final Map<String, Map<String, Color>> _statusColors = {
    'success': {'background': colorVerde950, 'foreground': colorVerde200},
    'warning': {
      'background': Colors.orange.shade900,
      'foreground': Colors.orange.shade100,
    },
  };

  static final Map<String, Map<String, String>> _statusText = {
    'success': {
      'titulo': 'Sincronizado',
      'informacion': 'Los datos estan actualizados en el servidor',
    },
    'warning': {
      'titulo': 'Pendiente de sincronización',
      'informacion': 'Los cambios se sincronizaran cuando haya conexion',
    },
  };

  static final Map<String, String> _statusCategory = {
    'sincronizado': 'success',
    'pendiente': 'warning',
  };

  @override
  Widget build(BuildContext context) {
    final normalized = status.toLowerCase();
    final category = _statusCategory[normalized] ?? 'info';
    final colors = _statusColors[category]!;
    final text = _statusText[category]!;

    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors['background'],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: colorVerde500,
            size: 20,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text['titulo'] ?? '',
                  style: textTheme.bodyMedium!.copyWith(color: colorVerde500),
                ),
                Text(
                  text['informacion'] ?? '',
                  style: textTheme.bodySmall!.copyWith(color: gris),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
