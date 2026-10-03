import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(InitiSelectedServiceState(selectedService: null, isEnabled: false));
  selectService(ServiceType service) {
    emit(
      ChangingSelectedServiceState(
        selectedService: service,
        isEnabled: state.isEnabled,
      ),
    );
  }

  changeSwitch(bool val) {
    emit(
      ChangingSelectedServiceState(
        isEnabled: val,
        selectedService: state.selectedService,
      ),
    );
  }
}
