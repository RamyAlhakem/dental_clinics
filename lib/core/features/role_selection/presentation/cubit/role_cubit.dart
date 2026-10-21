import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoleCubit extends Cubit<RoleState> {
  RoleCubit() : super(const RoleUnknownState(selectedRole: null));
  selectClinic() {
    emit(const RoleClinicState(selectedRole: Roles.clinics));
  }

  selectPatient() {
    emit(const RolePatientState(selectedRole: Roles.patients));
  }

  clearRole() {
    emit(const RoleUnknownState(selectedRole: null));
  }
}
