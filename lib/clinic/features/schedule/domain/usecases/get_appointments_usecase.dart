import 'package:dental_clinics_app/clinic/features/schedule/domain/entities/appointment_entity.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class GetAppointmentsUseCase {
  final ScheduleRepository repository;

  GetAppointmentsUseCase({required this.repository});

  Future<AppResult<List<AppointmentEntity>>> call({
    required String role,
    required String docId,
  }) async {
    return await repository.getAppointments(role: role, docId: docId);
  }
}
