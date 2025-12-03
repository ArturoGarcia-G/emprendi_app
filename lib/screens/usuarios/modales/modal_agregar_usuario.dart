import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/input_base.dart';
import 'package:emprendi_app/controllers/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ModalAgregarUsuario extends StatefulWidget {
  const ModalAgregarUsuario({super.key});

  @override
  State<ModalAgregarUsuario> createState() => _ModalAgregarUsuarioState();
}

class _ModalAgregarUsuarioState extends State<ModalAgregarUsuario> {
  final TextEditingController nombreCompletoController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final usuarioCtrl = Get.find<UsuarioController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
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
                Text('Nuevo usuario', style: textTheme.bodyLarge),
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
            const Gap(8),
            const Text('Contraseña'),
            const Gap(4),
            InputBase(
              placeholder: 'Ingresa una contraseña',
              controller: passwordController,
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
                    label: 'Guardar usuario',
                    fn: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final success = await usuarioCtrl.agregarUsuario(
                          nombreCompleto: nombreCompletoController.text,
                          usuario: usuarioController.text,
                          password: passwordController.text,
                        );
                        if (success) {
                          Navigator.pop(context, true);
                        }
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