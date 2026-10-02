import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

class ProfileState {
  final ServiceType? selectedService;
  const ProfileState({this.selectedService});
}

class ChangingSelectedServiceState extends ProfileState {
  const ChangingSelectedServiceState({super.selectedService});
}

class InitiSelectedServiceState extends ProfileState {
  const InitiSelectedServiceState({super.selectedService});
}
