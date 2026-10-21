import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(const ChangingLangArabicState(selectedLang: Locale("ar")));
  changingLangToArabic() {
    emit(const ChangingLangArabicState(selectedLang: Locale("ar")));
  }

  changingLangToEnglish() {
    emit(const ChangingLangEnglishState(selectedLang: Locale("en")));
  }
}
