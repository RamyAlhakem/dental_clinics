import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NextAppointmentsWidget extends StatelessWidget {
  const NextAppointmentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Next apointments",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            "See all",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.labelColor),
          ),
        ],
      ),
    );
  }
}
