import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? listTileLeading;
  final bool? centerTitle;
  final double? leadingWidth;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? height;
  const AppAppBar({
    super.key,
    required this.title,
    this.leading,
    this.centerTitle,
    this.subtitle,
    this.leadingWidth,
    this.listTileLeading,
    this.actions,
    this.bottom,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      centerTitle: centerTitle,
      leading:
          leading ??
          GestureDetector(
            onTap: () => context.pop(),
            child: Icon(Icons.arrow_back_ios_new),
          ),
      title: subtitle == null
          ? Text(title)
          : ListTile(
              title: Text(title),
              subtitle: Text(subtitle!),
              leading: listTileLeading,
            ),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 60);
}
