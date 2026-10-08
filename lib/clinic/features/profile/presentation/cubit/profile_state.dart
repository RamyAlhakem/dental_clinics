import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

class ProfileState {
  final ServiceType? selectedService;
  final WeekDays? selectedDay;
  final bool isEnabled;
  final bool enabledDay;
  final UserEntitie? user;
  const ProfileState({
    this.selectedService,
    required this.isEnabled,
    required this.enabledDay,
    this.user,
    this.selectedDay,
  });
}

class ChangingSelectedServiceState extends ProfileState {
  const ChangingSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
    required super.enabledDay,
    super.user,
    super.selectedDay,
  });
}

class ChangingSelectedDayState extends ProfileState {
  const ChangingSelectedDayState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.enabledDay,
  });
}

class InitiSelectedServiceState extends ProfileState {
  const InitiSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.enabledDay,
  });
}

class LoadedUserInfoProfileState extends ProfileState {
  LoadedUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.enabledDay,
  });
}

class SuccessUserInfoProfileState extends ProfileState {
  final String msg;
  SuccessUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    required this.msg,
    super.user,

    super.selectedDay,
    required super.enabledDay,
  });
}

class LoadingUserInfoProfileState extends ProfileState {
  LoadingUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.enabledDay,
  });
}

class FailedUserInfoProfileState extends ProfileState {
  final String msg;
  FailedUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    required this.msg,
    super.user,
    super.selectedDay,
    required super.enabledDay,
  });
}
