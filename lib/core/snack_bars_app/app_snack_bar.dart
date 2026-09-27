import 'package:flutter/material.dart';

class AppSnackBar {
  static void _show(
    BuildContext context, {
    required String msg,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
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
