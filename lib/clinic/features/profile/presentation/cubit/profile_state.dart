import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

class ProfileState {
  final ServiceType? selectedService;
  final bool isEnabled;
  const ProfileState({this.selectedService, required this.isEnabled});
}

class ChangingSelectedServiceState extends ProfileState {
  const ChangingSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
  });
}

class InitiSelectedServiceState extends ProfileState {
  const InitiSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
  });
}
