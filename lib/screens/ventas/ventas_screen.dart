import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/controllers/venta_controller.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:emprendi_app/screens/ventas/widgets/card_venta.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VentasScreen extends StatefulWidget {
  const VentasScreen({super.key});

  @override
  State<VentasScreen> createState() => _VentasScreenState();
}

class _VentasScreenState extends State<VentasScreen> {
  final storage = GetStorage();

  final ventaController = Get.find<VentaController>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ventaController.listarVentas();
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
          final result = await Get.toNamed(PagesRoutes.agregarVentaScreen);
          if (result == true) {
            ventaController.listarVentas();
          }
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Gestión de ventas', style: textTheme.bodyLarge)],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Obx(() {
                final ventas = ventaController.ventas;

                if (ventaController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (ventas.isEmpty) {
                  return const Center(child: Text('No hay ventas disponibles'));
                }

                return Container(
                  margin: const EdgeInsets.only(bottom: 68),
                  child: CardBase(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header con título y "Ver más"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ventas recientes',
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Ver más ventas');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Ver más',
                                    style: textTheme.bodySmall?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Gap(4),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Gap(16),
                        // Lista de ventas con altura fija
                        SizedBox(
                          height: 400, // Altura fija para la lista
                          child: RefreshIndicator(
                            onRefresh: () async {
                              await ventaController.listarVentas();
                            },
                            child: ListView.separated(
                              itemCount: ventas.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 6),
                              itemBuilder: (context, index) {
                                final venta = ventas[index];
                                return CardVenta(venta: venta);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
