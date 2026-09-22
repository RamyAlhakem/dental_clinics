import 'package:dental_clinics_app/core/features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(ChangingIndexState(index: 0));
  setIndexPage(int val) {
    emit(ChangingIndexState(index: val));
  }
}
