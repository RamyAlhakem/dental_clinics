import 'package:equatable/equatable.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/entities/appointment_entity.dart';

sealed class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object?> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleLoaded extends ScheduleState {
  final List<AppointmentEntity> appointments;

  const ScheduleLoaded(this.appointments);
  List<AppointmentEntity> get pendingAppointments => appointments
      .where((appointment) => appointment.status == "pending")
      .toList();
  List<AppointmentEntity> get acceptedAppointments => appointments
      .where((appointment) => appointment.status == "accepted")
      .toList();
  List<AppointmentEntity> get declinedAppointments => appointments
      .where((appointment) => appointment.status == "declined")
      .toList();
  List<AppointmentEntity> get completedAppointments => appointments
      .where((appointment) => appointment.status == "completed")
      .toList();

  @override
  List<Object?> get props => [appointments];
}

class ScheduleError extends ScheduleState {
  final String message;

  const ScheduleError(this.message);

  @override
  List<Object?> get props => [message];
}
