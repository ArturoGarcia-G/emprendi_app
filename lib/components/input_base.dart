import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class InputBase extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool requerido;

  const InputBase({
    super.key,
    required this.placeholder,
    this.controller,
    this.validator,
    this.keyboardType,
    this.requerido = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintStyle: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: colorGris),
      ),
      validator: (value) {
        if (requerido && (value == null || value.isEmpty)) {
          return 'Campo requerido';
        }
        if (validator != null) {
          return validator!(value);
        }
        return null;
      },
    );
  }
}
