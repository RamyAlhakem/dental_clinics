import 'package:dental_clinics_app/clinic/features/profile/data/models/day_schedule_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/schedule_days_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class SaveSingleDayUseCase {
  final ProfileRepository repository;
  SaveSingleDayUseCase({required this.repository});
  Future<AppResult<String>> call({
    required String role,
    required String docId,
    required String dayKey,
    required DayScheduleModels day,
  }) async {
    return await repository.saveSingleDay(
      role: role,
      docId: docId,
      day: day,
      dayKey: dayKey,
    );
  }
}
