import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/select_time_widget.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TimeBlockWidget extends StatelessWidget {
  const TimeBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.lighterPrimaryColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Morning",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "Remove",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.redWineColor),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectTimeWidget(),
              SvgWidget(icon: "line"),
              SelectTimeWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
