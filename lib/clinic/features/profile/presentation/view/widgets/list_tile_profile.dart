import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ListTileProfile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const ListTileProfile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      leading: SvgWidget(icon: icon),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppColors.iconColor,
      ),
    );
  }
}
