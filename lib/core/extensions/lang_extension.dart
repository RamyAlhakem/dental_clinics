import 'package:dental_clinics_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LangExtension on BuildContext {
  AppLocalizations get arb => AppLocalizations.of(this)!;
}
