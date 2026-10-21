import 'package:dental_clinics_app/core/componeents/component_language.dart';
import 'package:flutter/material.dart';

class DialogSelectLanguage extends StatelessWidget {
  const DialogSelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [ComponentLanguage()],
        ),
      ),
    );
  }
}
