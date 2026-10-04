import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';

abstract class ProfileRemoteDataSource {
  Future addNewService({
    required String role,
    required String docId,
    required ServiceModel service,
  });
  Future<QuerySnapshot<Map<String, dynamic>>> getInfoUser({
    required String role,
    required String userId,
  });
}
