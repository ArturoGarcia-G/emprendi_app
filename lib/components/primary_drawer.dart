import 'package:emprendi_app/controllers/auth_controller.dart';
import 'package:emprendi_app/controllers/theme_controller.dart';
import 'package:emprendi_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryDrawer extends StatelessWidget {
  const PrimaryDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final authController = Get.find<AuthController>();
    final themeController = Get.find<ThemeController>();

    // Modelos
    Usuario? usuario = authController.usuario;

    // Tema actual
    final colorScheme = Theme.of(context).colorScheme;
    final drawerTheme = Theme.of(context).drawerTheme;
    final cardTheme = Theme.of(context).cardTheme;
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 18),
        color: drawerTheme.backgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // --- Perfil ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardTheme.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=3',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              usuario?.nombreCompleto ?? '',
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              'juan.perez@empresa.com',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                            Text(
                              'Emprendedor • Plan Premium',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: colorScheme.primary,
                        side: BorderSide(
                          color: colorScheme.onSurface.withOpacity(0.2),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Editar Perfil'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- Ajustes ---
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => SwitchListTile(
                      activeColor: colorScheme.primary,
                      title: Text(
                        'Modo Oscuro',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      value: themeController.isDarkMode,
                      onChanged: (val) => themeController.toggleTheme(),
                    ),
                  ),
                  SwitchListTile(
                    activeColor: colorScheme.primary,
                    title: Text(
                      'Notificaciones',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurface,
                      ),
                    ),
                    value: true,
                    onChanged: (val) {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // --- Opciones ---
            ListTile(
              leading: Icon(Icons.settings, color: colorScheme.onSurface),
              title: Text(
                'Configuración Avanzada',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock, color: colorScheme.onSurface),
              title: Text(
                'Privacidad y Seguridad',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: colorScheme.onSurface),
              title: Text(
                'Ayuda y Soporte',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              onTap: () {},
            ),

            Divider(color: colorScheme.onSurface.withOpacity(0.2), height: 32),

            // --- Cerrar Sesión ---
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
              onTap: () {
                authController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
