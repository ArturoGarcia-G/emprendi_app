import 'package:flutter/material.dart';

class SecundaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const SecundaryAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: appBarTheme.backgroundColor,
      elevation: 0,
      titleSpacing: 0,
      shape: Border(bottom: BorderSide(color: colorScheme.outline)),
      title: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          titulo,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
