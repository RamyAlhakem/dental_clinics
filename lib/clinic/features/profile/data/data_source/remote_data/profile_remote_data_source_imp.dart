import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/data_source/remote_data/profile_remote_data_source.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';

class ProfileRemoteDataSourceImp implements ProfileRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  ProfileRemoteDataSourceImp({required this.firebaseFirestore});
  @override
  addNewService({
    required String role,
    required String docId,
    required ServiceModel service,
  }) async {
    await firebaseFirestore.collection(role).doc(docId).update({
      "services": FieldValue.arrayUnion([service.toJson()]),
    });
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getInfoUser({
    required String role,
    required String userId,
  }) async {
    return await firebaseFirestore
        .collection(role)
        .where("id", isEqualTo: userId)
        .get();
  }
}
