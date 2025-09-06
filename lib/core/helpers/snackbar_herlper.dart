import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../main.dart';
import 'package:flutter/material.dart';

enum SnackbarType { success, error, warning }

class SnackbarHelper {
  static void show(String message, {SnackbarType type = SnackbarType.error}) {
    final cleanedMessage = message.replaceFirst(RegExp(r'^Exception:\s*'), '');
    final overlay = overlayKey.currentState;
    if (overlay == null) return;

    switch (type) {
      case SnackbarType.success:
        showTopSnackBar(
          overlay,
          CustomSnackBar.success(message: cleanedMessage),
        );
        break;
      case SnackbarType.error:
        showTopSnackBar(
          overlay,
          SizedBox(
            height: 60,
            child: CustomSnackBar.error(
              message: cleanedMessage,
              backgroundColor: colorRojo800,
              icon: const Icon(
                Icons.error_outline,
                color: Color(0x15000000),
                size: 75,
              ),
            ),
          ),
        );
        break;
      case SnackbarType.warning:
        showTopSnackBar(overlay, CustomSnackBar.info(message: cleanedMessage));
        break;
    }
  }
}
