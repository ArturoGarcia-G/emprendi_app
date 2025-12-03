import 'package:emprendi_app/components/banner_status_sincronizacion.dart';
import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/modales/modal_eliminar.dart';
import 'package:emprendi_app/components/secundary_app_bar.dart';
import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/controllers/cliente_controller.dart';
import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/cliente.dart';
import 'package:emprendi_app/screens/clientes/modales/modal_editar_cliente.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ClienteDetalleScreen extends StatefulWidget {
  final String clienteId;
  const ClienteDetalleScreen({super.key, required this.clienteId});

  @override
  State<ClienteDetalleScreen> createState() => _ClienteDetalleScreenState();
}

class _ClienteDetalleScreenState extends State<ClienteDetalleScreen> {
  final clienteController = Get.find<ClienteController>();
  Cliente? _cliente;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCliente();
  }

  Future<void> _loadCliente() async {
    try {
      final cliente = await clienteController.obtenerCliente(
        clienteId: widget.clienteId,
      );
      if (!mounted) return;
      setState(() {
        _cliente = cliente;
        _isLoading = false;
      });
    } catch (e) {
      if (mounted) Get.back();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SnackbarHelper.show(e.toString());
        Get.back();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final dateFormat = DateFormat('d MMM yyyy HH:mm', 'es_MX');

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final cliente = _cliente!;
    return Scaffold(
      appBar: const SecundaryAppBar(titulo: 'Detalle del cliente'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            _loadCliente();
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CardBase(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: colorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.all(6),
                              child: Icon(
                                Icons.person_outline_rounded,
                                color: colorScheme.onPrimaryContainer,
                                size: 35,
                              ),
                            ),
                            const Gap(8),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cliente.nombre ?? '',
                                            style: textTheme.titleMedium,
                                          ),
                                          const Gap(4),
                                          Text(
                                            'SKU: ',
                                            style: textTheme.bodyMedium!
                                                .copyWith(color: gris),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      StatusGlobal(
                                        status: cliente.status ?? '',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      CardBase(
                        icono: Icons.info_outline,
                        titulo: 'Información del cliente',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Icon(
                                    Icons.numbers_rounded,
                                    size: 15,
                                    color: gris,
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Folio local',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text(
                                        '${cliente.folioLocal ?? '--'}',
                                        style: textTheme.bodyMedium!.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Icon(
                                    Icons.numbers_rounded,
                                    size: 15,
                                    color: gris,
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Folio global',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text(
                                        '${cliente.folioGlobal ?? '--'}',
                                        style: textTheme.bodyMedium!.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Icon(
                                    Icons.phone_outlined,
                                    size: 15,
                                    color: gris,
                                  ),
                                ),
                                const Gap(16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Telefono',
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: gris,
                                        ),
                                      ),
                                      Text(
                                        cliente.telefono ?? '--',
                                        style: textTheme.bodyMedium!.copyWith(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      CardBase(
                        icono: Icons.cloud_outlined,
                        titulo: 'Estado de sincronización',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BannerStatusSincronizacion(
                              status: cliente.statusSincronizacion ?? '',
                            ),
                            const Gap(12),
                            Row(
                              children: [
                                Text(
                                  'Última sincronización',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: gris,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '28 ene 2024, 10:30', //TODO: actualizar
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      CardBase(
                        icono: Icons.person_4_outlined,
                        titulo: 'Información de registro',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Creado por',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: gris,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  'Admin',
                                  style: textTheme.bodySmall,
                                ), //TODO: Actualizar a creador
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Fecha de creación',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: gris,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  cliente.registroFecha == null
                                      ? '--'
                                      : dateFormat.format(
                                          cliente.registroFecha!,
                                        ),
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Última actualización',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: gris,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  cliente.actualizacionFecha == null
                                      ? '--'
                                      : dateFormat.format(
                                          cliente.actualizacionFecha!,
                                        ),
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(8),
                    ],
                  ),
                ),
              ),
              const Gap(8),
              Row(
                children: [
                  Expanded(
                    child: BotonBase(
                      label: 'Editar', //TODO: Agregar icono
                      fn: () async {
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
                          _loadCliente();
                        }
                      },
                      tipo: BotonTipo.secundario,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: BotonBase(
                      label: 'Eliminar', //TODO: Agregar icono
                      fn: () async {
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
                      tipo: BotonTipo.eliminar,
                    ),
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
