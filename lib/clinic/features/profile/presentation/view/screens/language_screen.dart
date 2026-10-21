import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/component_language.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.language),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: ComponentLanguage(width: 150, height: 150),
      ),
    );
  }
}
