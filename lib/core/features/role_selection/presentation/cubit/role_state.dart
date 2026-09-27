import 'package:equatable/equatable.dart';

enum Roles { clinics, patients }

sealed class RoleState extends Equatable {
  final Roles? selectedRole;
  const RoleState({required this.selectedRole});
  @override
  List<Object?> get props => [selectedRole];
}

class RoleUnknownState extends RoleState {
  const RoleUnknownState({required super.selectedRole});
}

class RoleClinicState extends RoleState {
  const RoleClinicState({required super.selectedRole});
}

class RolePatientState extends RoleState {
  const RolePatientState({required super.selectedRole});
}
