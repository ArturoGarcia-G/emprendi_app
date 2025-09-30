import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/producto.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// Enum para mayor claridad
enum TipoMovimiento { alta, baja }

class ModalAjustarStock extends StatefulWidget {
  final Producto producto;
  final Future<void> Function() fnAjuste;

  const ModalAjustarStock({
    super.key,
    required this.producto,
    required this.fnAjuste,
  });

  @override
  State<ModalAjustarStock> createState() => _ModalAjustarStockState();
}

class _ModalAjustarStockState extends State<ModalAjustarStock> {
  TipoMovimiento? tipoSeleccionado = TipoMovimiento.alta;
  final TextEditingController cantidadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Ajustar stock', style: textTheme.bodyLarge),
          const Divider(),
          const Gap(8),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorGris800,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  'Stock actual',
                  style: textTheme.bodySmall!.copyWith(color: gris),
                ),
                Text(
                  ' ${widget.producto.stock} unidades',
                  style: textTheme.titleLarge!.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const Gap(12),
          const Text('Tipo de ajuste'),
          const Gap(4),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    tipoSeleccionado = TipoMovimiento.alta;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: tipoSeleccionado == TipoMovimiento.alta
                            ? colorVerde700
                            : colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: Radio<TipoMovimiento>(
                            value: TipoMovimiento.alta,
                            groupValue: tipoSeleccionado,
                            activeColor: colorVerde700,
                            onChanged: (value) {
                              setState(() {
                                tipoSeleccionado = value;
                              });
                            },
                          ),
                        ),
                        const Icon(
                          Icons.add_rounded,
                          color: colorVerde700,
                          size: 18,
                        ),
                        const Gap(4),
                        Text('Alta de stock', style: textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() {
                    tipoSeleccionado = TipoMovimiento.baja;
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.all(
                        color: tipoSeleccionado == TipoMovimiento.baja
                            ? colorRojo500
                            : colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                          height: 32,
                          child: Radio<TipoMovimiento>(
                            value: TipoMovimiento.baja,
                            groupValue: tipoSeleccionado,
                            activeColor: colorRojo500,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              setState(() {
                                tipoSeleccionado = value;
                              });
                            },
                          ),
                        ),
                        const Icon(
                          Icons.add_rounded,
                          color: colorRojo500,
                          size: 18,
                        ),
                        const Gap(4),
                        Text('Baja de stock', style: textTheme.bodySmall),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          const Text('Cantidad a ajustar'),
          const Gap(4),
          InputBase(
            placeholder: 'Ingresa la cantidad',
            controller: cantidadController,
          ),
          const Gap(16),
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
                  label: 'Realizar ajuste',
                  fn: () async {
                    await widget.fnAjuste();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
