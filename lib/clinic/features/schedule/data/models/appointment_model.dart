import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required super.appointmentId,
    required super.patientId,
    required super.patientName,
    required super.appointmentDateTime,
    required super.createdAt,
    required super.status,
  });

  factory AppointmentModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AppointmentModel(
      appointmentId: doc.id,
      patientId: data['patientId'] ?? '',
      patientName: data['patientName'] ?? '',
      appointmentDateTime: (data['appointmentDateTime'] as Timestamp).toDate(),
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      status: data['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'patientId': patientId,
      'clinicId': patientName,
      'appointmentDateTime': Timestamp.fromDate(appointmentDateTime),
      'createdAt': Timestamp.fromDate(createdAt),
      'status': status,
    };
  }

  @override
  String toString() {
    return 'AppointmentModel(appointmentId: $appointmentId, patientId: $patientId, patientName: $patientName, appointmentDateTime: $appointmentDateTime, createdAt: $createdAt, status: $status)';
  }
}
