import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset("assets/lottie/Done.json", repeat: false),
            Text(
              context.arb.accountCreatedSuccessfully,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              context.arb.checkInboxToVerifyEmail,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            AppButton(
              onPressed: () {
                context.pushReplacementNamed(RouteNames.signIn);
              },
              text: context.arb.getStarted,
              width: context.screenWidth / 2,
            ),
          ],
        ),
      ),
    );
  }
}
