import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/controllers/usuario_controller.dart';
import 'package:emprendi_app/screens/usuarios/modales/modal_agregar_usuario.dart';
import 'package:emprendi_app/screens/usuarios/widgets/card_usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  final storage = GetStorage();

  final usuarioController = Get.find<UsuarioController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      usuarioController.listarUsuarios();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const PrimaryAppBar(avatarUrl: ''),
      drawer: const PrimaryDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            builder: (context) {
              return const ModalAgregarUsuario();
            },
          );

          if (result == true) {
            usuarioController.listarUsuarios();
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Usuarios', style: textTheme.bodyLarge),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                final usuarios = usuarioController.usuarios;

                if (usuarioController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (usuarios.isEmpty) {
                  return const Center(
                    child: Text('No hay usuarios disponibles'),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await usuarioController.listarUsuarios();
                  },
                  child: ListView.separated(
                    itemCount: usuarios.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (context, index) {
                      final usuario = usuarios[index];
                      return CardUsuario(usuario: usuario);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}