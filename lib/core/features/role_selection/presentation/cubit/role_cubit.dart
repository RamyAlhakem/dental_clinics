import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit() : super(RoleUnknownState(selectedRole: null));
  selectClinic() {
    emit(RoleClinicState(selectedRole: Roles.clinics));
  }

  selectPatient() {
    emit(RolePatientState(selectedRole: Roles.patients));
  }
}
