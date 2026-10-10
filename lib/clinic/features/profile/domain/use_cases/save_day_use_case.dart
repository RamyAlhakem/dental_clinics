import 'package:dental_clinics_app/clinic/features/profile/data/models/schedule_days_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class SaveDayUseCase {
  final ProfileRepository repository;
  SaveDayUseCase({required this.repository});
  Future<AppResult<String>> call({
    required String role,
    required String docId,
    required ScheduleDaysModels scheduleDay,
  }) async {
    return await repository.saveDay(
      role: role,
      docId: docId,
      scheduleDay: scheduleDay,
    );
  }
}
