import 'package:flutter/material.dart';

class AppSnackBar {
  static void _show(
    BuildContext context, {
    required String msg,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(msg), Icon(icon)],
        ),
      ),
    );
  }

  static void showSuccess(BuildContext context, {required String msg}) {
    _show(context, msg: msg, icon: Icons.check_circle_outlined);
  }

  static void showError(BuildContext context, {required String msg}) {
    _show(context, msg: msg, icon: Icons.error_outline);
  }
}
