import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/view/widgets/onboarding_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/texts/contents.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            spacing: 30,
            children: [
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      context.goNamed(RouteNames.roleSelction);
                    },
                    child: Text(context.arb.skip),
                  ),
                ],
              ),
              SizedBox(
                height: context.screenHeight / 1.7,
                child: PageView(
                  onPageChanged: (value) {
                    context.read<OnboardingCubit>().setIndexPage(value);
                  },
                  controller: _controller,
                  children: [
                    OnboardingWidget(
                      title: context.arb.luxuryDentalCare,
                      subtitle: context
                          .arb
                          .experienceWorldClassTreatmentInaSophisticatedModernEnvironmentDesignedForYourComfort,
                      img: "Dental Care Onboarding",
                    ),
                    OnboardingWidget(
                      title: context.arb.smartScheduling,
                      subtitle: context
                          .arb
                          .easilyBookAppointmentsManageYourUpcomingVisitsAndTrackYourDentalHealthStatusFromAnywhere,
                      img: "Schedule onboarding",
                    ),
                    OnboardingWidget(
                      title: context.arb.digitalRecords,
                      subtitle: context
                          .arb
                          .accessYourFullDentalHistoryInteractiveOdontogramsAndTreatmentPlansInRealTimeAnytime,
                      img: "Digital recordes Onboarding",
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: WormEffect(
                  dotColor: AppColors.darkGreyColor,
                  activeDotColor: AppColors.iconColor,
                ),
              ),
              SizedBox(height: 10),
              BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) {
                  if (state.index == 2) {
                    return AppButtonGredient(
                      text: context.arb.letsGo,
                      onTap: () {
                        context.goNamed(RouteNames.roleSelction);
                      },
                    );
                  } else {
                    return AppButtonGredient(
                      text: context.arb.next,
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
