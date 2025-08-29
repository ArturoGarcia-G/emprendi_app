import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nombreUsuario;
  final String avatarUrl;
  final int notificaciones;

  const PrimaryAppBar({
    super.key,
    required this.nombreUsuario,
    required this.avatarUrl,
    this.notificaciones = 0,
  });

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;

    return AppBar(
      backgroundColor: appBarTheme.backgroundColor, // Fondo oscuro
      elevation: 0,
      automaticallyImplyLeading: false, // quitamos back button automático
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Avatar clickable para abrir drawer
            GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: CircleAvatar(
                radius: 20,
                //backgroundImage: NetworkImage(avatarUrl),
              ),
            ),
            const SizedBox(width: 12),
            // Textos de bienvenida
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  nombreUsuario,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.white),
              onPressed: () {},
            ),
            if (notificaciones > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    notificaciones.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
