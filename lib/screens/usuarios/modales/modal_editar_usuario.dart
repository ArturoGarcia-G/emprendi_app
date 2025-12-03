import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/controllers/usuario_controller.dart';
import 'package:emprendi_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ModalEditarUsuario extends StatefulWidget {
  final Usuario usuario;
  const ModalEditarUsuario({super.key, required this.usuario});

  @override
  State<ModalEditarUsuario> createState() => _ModalEditarUsuarioState();
}

class _ModalEditarUsuarioState extends State<ModalEditarUsuario> {
  late final TextEditingController nombreCompletoController;
  late final TextEditingController usuarioController;
  final _formKey = GlobalKey<FormState>();
  final usuarioCtrl = Get.find<UsuarioController>();

  @override
  void initState() {
    super.initState();
    // Inicializamos los controllers con los valores actuales del usuario
    nombreCompletoController = TextEditingController(
      text: widget.usuario.nombreCompleto,
    );
    usuarioController = TextEditingController(text: widget.usuario.usuario);
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
                Text('Editar usuario', style: textTheme.bodyLarge),
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
            const Text('Usuario'),
            const Gap(4),
            InputBase(
              placeholder: 'Ej: juan.perez',
              controller: usuarioController,
              requerido: true,
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
                        await usuarioCtrl.editarUsuario(
                          nombreCompleto: nombreCompletoController.text,
                          usuario: usuarioController.text,
                          usuarioId: widget.usuario.usuarioId!,
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