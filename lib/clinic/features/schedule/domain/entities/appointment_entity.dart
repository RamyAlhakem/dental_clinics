import 'package:equatable/equatable.dart';

class AppointmentEntity extends Equatable {
  final String appointmentId;
  final String patientId;
  final String patientName;
  final DateTime appointmentDateTime;
  final DateTime createdAt;
  final String status;

  const AppointmentEntity({
    required this.appointmentId,
    required this.patientId,
    required this.patientName,
    required this.appointmentDateTime,
    required this.createdAt,
    required this.status,
  });

  @override
  List<Object?> get props => [
    appointmentId,
    patientId,
    patientName,
    appointmentDateTime,
    createdAt,
    status,
  ];
}
