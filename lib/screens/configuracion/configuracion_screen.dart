import 'package:emprendi_app/components/card_base.dart';
import 'package:emprendi_app/components/primary_app_bar.dart';
import 'package:emprendi_app/components/primary_drawer.dart';
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:emprendi_app/routes/pages_routes.dart';
import 'package:emprendi_app/screens/configuracion/widgets/item_menu.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfiguracionScreen extends StatelessWidget {
  final storage = GetStorage();

  ConfiguracionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Tema
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: const PrimaryDrawer(),
      appBar: const PrimaryAppBar(avatarUrl: ''),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                          'Configuración',
                          style: textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Gestiona tu negocio con herramientas avanzadas',
                          style: textTheme.bodyMedium!.copyWith(color: gris),
                        ),
                      ],
                    ),
                  ),
                ),
                const Gap(21),
                Column(
                  spacing: 16,
                  children: [
                    CardBase(
                      titulo: 'Gestión',
                      colorTitulo: gris,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(PagesRoutes.gestorUsuariosScreen);
                            },
                            child: const ItemMenu(
                              titulo: 'Gestor de usuarios',
                              subtitulo: 'Administrar usuarios del sistema',
                              icono: Icons.group_outlined,
                              colorIcono: colorVerde500,
                              backgroundIcono: colorVerde900,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(PagesRoutes.gestorClientesScreen);
                            },
                            child: const ItemMenu(
                              titulo: 'Gestor de clientes',
                              subtitulo: 'Administrar clientes y contactos',
                              icono: Icons.business_center_outlined,
                              colorIcono: colorAquamarina,
                              backgroundIcono: colorTeal900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CardBase(
                      titulo: 'Configuración',
                      colorTitulo: gris,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          ItemMenu(
                            titulo: 'Configuración general',
                            subtitulo: 'Ajustes de la aplicacion',
                            icono: Icons.settings_outlined,
                            colorIcono: colorGris500,
                            backgroundIcono: colorGris800,
                          ),
                        ],
                      ),
                    ),
                    const CardBase(
                      titulo: 'Soporte',
                      colorTitulo: gris,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12,
                        children: [
                          ItemMenu(
                            titulo: 'Contactar soporte',
                            subtitulo: 'Obtener ayuda tecnica',
                            icono: Icons.group_outlined,
                            colorIcono: colorNaranja600,
                            backgroundIcono: colorNaranja900,
                          ),
                        ],
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
