import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/controllers/cliente_controller.dart';
import 'package:emprendi_app/models/cliente.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ModalEditarCliente extends StatefulWidget {
  final Cliente cliente;
  const ModalEditarCliente({super.key, required this.cliente});

  @override
  State<ModalEditarCliente> createState() => _ModalEditarClienteState();
}

class _ModalEditarClienteState extends State<ModalEditarCliente> {
  late final TextEditingController nombreCompletoController;
  late final TextEditingController telefonoController;
  final _formKey = GlobalKey<FormState>();
  final clienteController = Get.find<ClienteController>();

  @override
  void initState() {
    super.initState();
    // Inicializamos los controllers con los valores actuales del producto
    nombreCompletoController = TextEditingController(
      text: widget.cliente.nombre,
    );
    telefonoController = TextEditingController(text: widget.cliente.telefono);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
                const Gap(8),
                Text('Editar cliente', style: textTheme.bodyLarge),
                const Spacer(),
                GestureDetector(
                  child: const Icon(Icons.close_rounded, size: 20),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
            const Divider(),
            const Gap(8),
            const Text('Nombre completo'),
            const Gap(4),
            InputBase(
              placeholder: 'Ej: Juan Perez Hernandez',
              controller: nombreCompletoController,
              requerido: true,
            ),
            const Gap(8),
            const Text('Telefono (Opcional)'),
            const Gap(4),
            InputBase(
              placeholder: 'Ej: 775 123 1234',
              controller: telefonoController,
              keyboardType: TextInputType.number,
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
                    label: 'Editar',
                    fn: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await clienteController.editarCliente(
                          nombre: nombreCompletoController.text,
                          telefono: telefonoController.text,
                          clienteId: widget.cliente.clienteId!,
                        );
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pop(context, true);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
