import 'package:flutter/material.dart';

class DialogAppAnimation {
  static show(BuildContext context, {required Widget childPageBuilder}) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, animationTwo) {
        return childPageBuilder;
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(scale: animation, child: child);
      },
    );
  }
}
