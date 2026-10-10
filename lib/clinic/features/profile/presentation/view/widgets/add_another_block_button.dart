import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddAnotherBlockButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddAnotherBlockButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(10),
          color: AppColors.primaryColor,
          dashPattern: [12, 4],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              SvgWidget(icon: "add", color: AppColors.primaryColor),
              Text(
                "Add another block",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
