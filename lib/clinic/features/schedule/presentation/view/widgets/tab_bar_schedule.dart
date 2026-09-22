import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TabBarSchedule extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  const TabBarSchedule({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: controller,
      tabs: [
        Tab(text: context.arb.newText),
        Tab(text: context.arb.accepted),
        Tab(text: context.arb.declined),
        Tab(text: context.arb.completed),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(0);
}
