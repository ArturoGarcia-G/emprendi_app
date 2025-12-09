import 'package:emprendi_app/components/banner_status_sincronizacion.dart';
import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/modales/modal_eliminar.dart';
import 'package:emprendi_app/components/secundary_app_bar.dart';
import 'package:emprendi_app/components/status_global.dart';
import 'package:emprendi_app/controllers/venta_controller.dart';
import 'package:emprendi_app/core/helpers/snackbar_herlper.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/core/utils/number_utils.dart';
import 'package:emprendi_app/models/venta.dart';
import 'package:emprendi_app/screens/ventas/widgets/card_venta_detalle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VentaDetalleScreen extends StatefulWidget {
  final String ventaId;
  const VentaDetalleScreen({super.key, required this.ventaId});

  @override
  State<VentaDetalleScreen> createState() => _VentaDetalleScreenState();
}

class _VentaDetalleScreenState extends State<VentaDetalleScreen> {
  final ventaController = Get.find<VentaController>();
  Map<String, dynamic>? _ventaData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVentaDetalle();
  }

  Future<void> _loadVentaDetalle() async {
    try {
      final ventaData = await ventaController.obtenerVentaConDetalles(
        ventaId: widget.ventaId,
      );
      if (!mounted) return;
      setState(() {
        _ventaData = ventaData;
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

  Future<void> _cancelarVenta() async {
    final Venta venta = _ventaData!['venta'];

    await showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return ModalEliminar(
          tipoRegistro: 'venta',
          nombreRegistro:
              'Venta #${venta.folio ?? 'S/N'} - ${venta.clienteNombre ?? 'Cliente no identificado'}',
          textoAdvertencia:
              'Esta acción cancelará la venta y no se puede deshacer. Los productos no regresarán al inventario automáticamente.',
          onEliminar: () async {
            try {
              await ventaController.cancelarVenta(ventaId: widget.ventaId);
              Navigator.pop(context);
              Get.back(result: true);
            } catch (e) {
              Navigator.pop(context);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final dateFormat = DateFormat('d MMM yyyy HH:mm', 'es_MX');

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final Venta venta = _ventaData!['venta'];
    final List<dynamic> detalles = _ventaData!['detalles'];

    return Scaffold(
      appBar: const SecundaryAppBar(titulo: 'Detalle de la venta'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: () async {
            _loadVentaDetalle();
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Información general de la venta
                      CardBase(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: colorScheme.primary,
                                  ),
                                  child: Icon(
                                    Icons.receipt_long,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                                const Gap(12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Venta #${venta.folio ?? 'S/N'}',
                                                  style: textTheme.titleMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          StatusGlobal(
                                            status: venta.status ?? '',
                                          ),
                                        ],
                                      ),
                                      const Gap(12),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Cliente',
                                                style: textTheme.bodySmall
                                                    ?.copyWith(
                                                      color: colorGris,
                                                    ),
                                              ),
                                              Text(
                                                venta.clienteNombre ?? 'N/A',
                                                style: textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Total',
                                                style: textTheme.bodySmall
                                                    ?.copyWith(
                                                      color: colorGris,
                                                    ),
                                              ),
                                              Text(
                                                NumberUtils.formatMoney(
                                                  venta.total ?? 0,
                                                ),
                                                style: textTheme.titleLarge
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: colorVerde500,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ],
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

                      // Productos de la venta
                      CardBase(
                        icono: Icons.shopping_cart_outlined,
                        titulo: 'Productos (${detalles.length})',
                        child: Column(
                          children: detalles.map((detalleConProducto) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CardVentaDetalle(
                                detalleConProducto: detalleConProducto,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const Gap(16),

                      CardBase(
                        icono: Icons.credit_card_outlined,
                        titulo: 'Información de pago',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Metodo de pago',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: colorGris,
                                  ),
                                ),
                                const Spacer(),
                                Text('Efectivo', style: textTheme.bodySmall),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),

                      // Estado de sincronización
                      CardBase(
                        icono: Icons.cloud_outlined,
                        titulo: 'Estado de sincronización',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BannerStatusSincronizacion(
                              status: venta.statusSincronizacion ?? '',
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),

                      // Información de registro
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
                                    color: colorGris,
                                  ),
                                ),
                                const Spacer(),
                                Text('Admin', style: textTheme.bodySmall),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Fecha de creación',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: colorGris,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  venta.registroFecha == null
                                      ? '--'
                                      : dateFormat.format(venta.registroFecha!),
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
              // Botón de cancelar venta (solo si está activa)
              if (venta.status == 'activa') ...[
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => BotonBase(
                      label: 'Cancelar venta',
                      isLoading: ventaController.isLoading.value,
                      fn: _cancelarVenta,
                      tipo: BotonTipo.eliminar,
                    ),
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorGris.withAlpha(10),
                    ),
                    child: Center(
                      child: Text(
                        'Venta ${venta.status}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorGris,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
