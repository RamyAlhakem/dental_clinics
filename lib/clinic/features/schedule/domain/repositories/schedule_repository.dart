import 'package:dental_clinics_app/clinic/features/schedule/domain/entities/appointment_entity.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

abstract class ScheduleRepository {
  Future<AppResult<List<AppointmentEntity>>> getAppointments({
    required String role,
    required String docId,
  });
}
