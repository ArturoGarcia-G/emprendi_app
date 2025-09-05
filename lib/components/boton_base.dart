import 'package:flutter/material.dart';

class BotonBase extends StatelessWidget {
  final String label;

  const BotonBase({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => {}, child: Text(label));
  }
}
