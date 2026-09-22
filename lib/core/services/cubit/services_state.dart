import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class ServicesState extends Equatable {
  final Locale selectedLang;
  const ServicesState({required this.selectedLang});
  @override
  List<Object?> get props => [selectedLang];
}

class ChangingLangArabicState extends ServicesState {
  const ChangingLangArabicState({required super.selectedLang});
}

class ChangingLangEnglishState extends ServicesState {
  const ChangingLangEnglishState({required super.selectedLang});
}
