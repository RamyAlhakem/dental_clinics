import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/home/data/data_source/remote_data/home_reomte_data_source.dart';

class HomeReomteDataSourceImp implements HomeReomteDataSource {
  final FirebaseFirestore firebaseFirestore;
  const HomeReomteDataSourceImp({required this.firebaseFirestore});
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getInquiries({
    required String role,
    required String docId,
  }) async {
    return await firebaseFirestore
        .collection(role)
        .doc(docId)
        .collection("inquiries")
        .get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> updateInquiry({
    required String role,
    required String docId,
    required String docIdInquiry,
  }) async {
    await firebaseFirestore
        .collection(role)
        .doc(docId)
        .collection("inquiries")
        .doc(docIdInquiry)
        .update({"replied": true});
    return await getInquiries(role: role, docId: docId);
  }
}
