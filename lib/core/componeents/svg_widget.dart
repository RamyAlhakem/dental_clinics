import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  final String icon;
  final double? horizontal;
  final double? vertical;
  const SvgWidget({
    super.key,
    required this.icon,
    this.horizontal,
    this.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ?? 0,
        vertical: vertical ?? 0,
      ),
      child: SvgPicture.asset("assets/icons/$icon.svg"),
    );
  }
}
