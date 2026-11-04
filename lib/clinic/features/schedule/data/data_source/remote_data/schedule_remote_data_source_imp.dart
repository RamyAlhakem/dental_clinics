import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/schedule/data/data_source/remote_data/schedule_remote_data_source.dart';
import 'package:dental_clinics_app/clinic/features/schedule/data/models/appointment_model.dart';

class ScheduleRemoteDataSourceImpl implements ScheduleRemoteDataSource {
  final FirebaseFirestore firestore;

  ScheduleRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<AppointmentModel>> getAppointments({
    required String role,
    required String docId,
  }) async {
    final querySnapshot = await firestore
        .collection(role)
        .doc(docId)
        .collection("appointments")
        .get();

    return querySnapshot.docs
        .map((doc) => AppointmentModel.fromFirestore(doc))
        .toList();
  }
}
