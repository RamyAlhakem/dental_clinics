import 'package:dental_clinics_app/clinic/features/home/di/di.dart';
import 'package:dental_clinics_app/clinic/features/profile/di/di.dart';
import 'package:dental_clinics_app/core/features/auth/di/di.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
initDi() {
  initProfileDi();
  initHomeDi();
  initAuthDi();
}
