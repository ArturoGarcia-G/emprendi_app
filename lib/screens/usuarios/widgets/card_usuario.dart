import 'package:emprendi_app/components/modales/modal_eliminar.dart';
import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/controllers/usuario_controller.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/usuario.dart';
import 'package:emprendi_app/screens/usuarios/modales/modal_editar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardUsuario extends StatelessWidget {
  final Usuario usuario;

  const CardUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final usuarioController = Get.find<UsuarioController>();

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
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
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          usuario.nombreCompleto ?? '',
                          style: textTheme.bodyMedium!.copyWith(
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const Gap(4),
                        usuario.statusSincronizacion == StatusConsts.sincronizado
                            ? const Icon(
                                Icons.cloud_done_outlined,
                                color: colorVerde500,
                                size: 14,
                              )
                            : const Icon(
                                Icons.cloud_sync_outlined,
                                color: colorGris600,
                                size: 14,
                              ),
                      ],
                    ),
                    const Gap(2),
                    Text(
                      'Usuario: ${usuario.usuario ?? ''}',
                      style: textTheme.bodySmall!.copyWith(color: colorGris),
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        const Icon(Icons.person_outline, size: 15, color: gris),
                        const Gap(8),
                        Text(
                          usuario.usuario ?? '--',
                          style: textTheme.bodySmall!.copyWith(
                            color: colorGris,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  StatusGlobal(status: usuario.status ?? ''),
                  const Gap(16),
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.edit_outlined,
                          color: colorScheme.onSurface,
                          size: 20,
                        ),
                        onTap: () async {
                          final result = await showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return ModalEditarUsuario(usuario: usuario);
                            },
                          );

                          if (result == true) {
                            usuarioController.listarUsuarios();
                          }
                        },
                      ),
                      const Gap(10),
                      GestureDetector(
                        child: const Icon(
                          Icons.delete_outline,
                          color: colorRojo900,
                          size: 20,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            useRootNavigator: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return ModalEliminar(
                                tipoRegistro: 'usuario',
                                nombreRegistro: usuario.nombreCompleto ?? '',
                                textoAdvertencia:
                                    'Se eliminará el usuario y no podrás volverlo a usar en ningún proceso del sistema',
                                onEliminar: () async {
                                  await usuarioController.eliminarUsuario(
                                    usuarioId: usuario.usuarioId!,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}