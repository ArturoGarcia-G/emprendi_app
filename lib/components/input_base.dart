import 'package:flutter/material.dart';

class InputBase extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;

  const InputBase({super.key, required this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
