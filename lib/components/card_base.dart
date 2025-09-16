import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardBase extends StatelessWidget {
  final String titulo;
  final Widget child;

  const CardBase({super.key, required this.child, required this.titulo});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titulo, style: textTheme.bodyMedium),
              Gap(12),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
