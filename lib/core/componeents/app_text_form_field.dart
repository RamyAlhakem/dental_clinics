import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String icon;
  final String? suffixIcon;
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: SvgWidget(icon: icon, horizontal: 10, vertical: 10),
        suffixIcon: suffixIcon != null
            ? SvgWidget(icon: suffixIcon!, horizontal: 10, vertical: 10)
            : null,
      ),
    );
  }
}
