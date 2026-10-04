import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

class ProfileState {
  final ServiceType? selectedService;
  final bool isEnabled;
  final UserEntitie? user;
  const ProfileState({
    this.selectedService,
    required this.isEnabled,
    this.user,
  });
}

class ChangingSelectedServiceState extends ProfileState {
  const ChangingSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
    super.user,
  });
}

class InitiSelectedServiceState extends ProfileState {
  const InitiSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
    super.user,
  });
}

class LoadedUserInfoProfileState extends ProfileState {
  LoadedUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    super.user,
  });
}

class SuccessUserInfoProfileState extends ProfileState {
  final String msg;
  SuccessUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    required this.msg,
    super.user,
  });
}

class LoadingUserInfoProfileState extends ProfileState {
  LoadingUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    super.user,
  });
}

class FailedUserInfoProfileState extends ProfileState {
  final String msg;
  FailedUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    required this.msg,
    super.user,
  });
}
