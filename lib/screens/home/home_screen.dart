import 'package:emprendi_app/components/boton_base.dart';
import 'package:emprendi_app/components/card_metrica.dart';
import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/components/row_base.dart';
import 'package:emprendi_app/controllers/auth_controller.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/models/usuario.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatelessWidget {
  final storage = GetStorage();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Tema
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    //Controllers
    final authController = Get.find<AuthController>();

    //Modelos
    Usuario? usuario = authController.usuario;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: PrimaryDrawer(),
      appBar: PrimaryAppBar(avatarUrl: ''),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          '¡Hola ${usuario?.nombreCompleto}!',
                          style: textTheme.titleLarge!.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Aqui tienes el resumen de tu negocio',
                          style: textTheme.bodyMedium!.copyWith(color: gris),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(21),
                Column(
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: CardMetrica(
                            titulo: 'Ventas de hoy',
                            valor: '2,450',
                            icon: Icons.attach_money,
                          ),
                        ),
                        Expanded(
                          child: CardMetrica(
                            titulo: 'Pedidos',
                            valor: '24',
                            icon: Icons.shopping_bag_outlined,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: CardMetrica(
                            titulo: 'Clientes',
                            valor: '65',
                            icon: Icons.group_outlined,
                          ),
                        ),
                        Expanded(
                          child: CardMetrica(
                            titulo: 'Meta del mes',
                            valor: '2,450',
                            icon: Icons.emoji_events_outlined,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Acciones rapidas',
                                style: textTheme.bodyMedium,
                              ),
                              Gap(12),
                              Column(
                                children: [
                                  Row(
                                    spacing: 6,
                                    children: [
                                      Expanded(
                                        child: BotonBase(
                                          label: 'Nueva venta',
                                          fn: () => {},
                                        ),
                                      ),
                                      Expanded(
                                        child: BotonBase(
                                          label: 'Crear producto',
                                          fn: () => Get.toNamed(
                                            PagesRoutes.agregarProductoScreen,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 6,
                                    children: [
                                      Expanded(
                                        child: BotonBase(
                                          label: 'Agregar cliente',
                                          fn: () => {},
                                        ),
                                      ),
                                      Expanded(
                                        child: BotonBase(
                                          label: 'Reportes',
                                          fn: () => {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(
                                'Resumen del dia',
                                style: textTheme.bodyMedium,
                              ),
                              Gap(8),
                              RowBase(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Productos vendidos'),
                                    Text('42 unidades'),
                                  ],
                                ),
                              ),
                              RowBase(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Productos vendidos'),
                                    Text('42 unidades'),
                                  ],
                                ),
                              ),
                              RowBase(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Productos vendidos'),
                                    Text('42 unidades'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
