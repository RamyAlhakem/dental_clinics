import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:flutter/material.dart';

class ExpansionTileProfile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ExpansionTileProfile({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: const Border(),

      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      childrenPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      children: children,
    );
  }
}
