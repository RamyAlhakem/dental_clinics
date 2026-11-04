import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/schedule/data/data_source/remote_data/schedule_remote_data_source.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/entities/appointment_entity.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/repositories/schedule_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:flutter/foundation.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final ScheduleRemoteDataSource remoteDataSource;

  ScheduleRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AppResult<List<AppointmentEntity>>> getAppointments({
    required String role,
    required String docId,
  }) async {
    try {
      final appointments = await remoteDataSource.getAppointments(
        role: role,
        docId: docId,
      );
      debugPrint("appointments =========>>>>>>> >>>>>  $appointments");
      return AppResult.success(appointments);
    } on FirebaseException catch (e) {
      return AppResult.failure(e.message ?? 'An error occurred firebase');
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
