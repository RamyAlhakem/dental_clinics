import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/list_tile_language.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DialogSelectLanguage extends StatelessWidget {
  const DialogSelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              width: 85,
              height: 85,
              fit: BoxFit.cover,
              "assets/lottie/Language.json",
              repeat: false,
            ),
            Text(
              context.arb.selectLanguage,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              context.arb.pleaseSelectYourPreferredLanguage,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 20),
            ListTileLanguage(
              languageCode: "en",
              text: "English",
              onTap: () {
                context.read<ServicesCubit>().changingLangToEnglish();
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 10),
            ListTileLanguage(
              languageCode: "ar",
              text: "العربية",
              onTap: () {
                context.read<ServicesCubit>().changingLangToArabic();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
