import 'package:emprendi_app/components/modales/modal_eliminar.dart';
import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/controllers/cliente_controller.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/cliente.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:emprendi_app/screens/clientes/modales/modal_editar_cliente.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CardCliente extends StatelessWidget {
  final Cliente cliente;

  const CardCliente({super.key, required this.cliente});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final clienteController = Get.find<ClienteController>();

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
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
                onTap: () async {
                  await Get.toNamed(
                    PagesRoutes.clienteDetalleScreen,
                    arguments: cliente.clienteId,
                  );
                  clienteController.listarClientes();
                },
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Get.toNamed(
                          PagesRoutes.clienteDetalleScreen,
                          arguments: cliente.clienteId,
                        );
                        clienteController.listarClientes();
                      },
                      child: Row(
                        children: [
                          Text(
                            cliente.nombre ?? '',
                            style: textTheme.bodyMedium!.copyWith(
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const Gap(4),
                          cliente.statusSincronizacion ==
                                  StatusConsts.sincronizado
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
                    ),
                    const Gap(2),
                    Text(
                      'Folio: ${cliente.folioGlobal}',
                      style: textTheme.bodySmall!.copyWith(color: colorGris),
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        const Icon(Icons.phone_outlined, size: 15, color: gris),
                        const Gap(8),
                        Text(
                          cliente.telefono ?? '--',
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
                  StatusGlobal(status: cliente.status ?? ''),
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
                              return ModalEditarCliente(cliente: cliente);
                            },
                          );

                          if (result == true) {
                            clienteController.listarClientes();
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
                                tipoRegistro: 'cliente',
                                nombreRegistro: cliente.nombre ?? '',
                                textoAdvertencia:
                                    'Se eliminara el cliente y no podrás volverlo a usar en ningun proceso del sistema',
                                onEliminar: () async {
                                  await clienteController.eliminarCliente(
                                    clienteId: cliente.clienteId!,
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
