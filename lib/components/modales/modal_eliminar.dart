import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ModalEliminar extends StatelessWidget {
  final String tipoRegistro;
  final String nombreRegistro;
  final String textoAdvertencia;
  final Future<void> Function() onEliminar;

  const ModalEliminar({
    super.key,
    required this.tipoRegistro,
    required this.nombreRegistro,
    required this.textoAdvertencia,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorRojo950,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(Icons.warning_amber_rounded, color: colorRojo400),
          ),
          const Gap(8),
          Text('Eliminar $tipoRegistro', style: textTheme.titleMedium),
          const Gap(8),
          Container(
            decoration: BoxDecoration(
              color: colorRojo950,
              border: Border.all(color: colorRojo900),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'Estás a punto de eliminar el siguiente $tipoRegistro',
                  style: textTheme.bodySmall!.copyWith(color: colorRojo200),
                ),
                const Gap(8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                    color: colorRojo900,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Text(
                      nombreRegistro,
                      style: textTheme.bodyMedium!.copyWith(
                        color: colorRojo100,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Text(
            textoAdvertencia,
            style: textTheme.bodySmall!.copyWith(color: gris),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: BotonBase(
                  label: 'Cancelar',
                  fn: () => Navigator.pop(context),
                  tipo: BotonTipo.secundario,
                ),
              ),
              const Gap(8),
              Expanded(
                child: BotonBase(
                  label: 'Eliminar',
                  fn: () async {
                    await onEliminar();
                  },
                  tipo: BotonTipo.eliminar,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
