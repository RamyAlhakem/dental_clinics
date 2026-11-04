import 'package:dental_clinics_app/clinic/features/schedule/data/models/appointment_model.dart';

abstract class ScheduleRemoteDataSource {
  Future<List<AppointmentModel>> getAppointments({
    required String role,
    required String docId,
  });
}
