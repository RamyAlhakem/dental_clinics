import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomeReomteDataSource {
  Future<QuerySnapshot<Map<String, dynamic>>> getInquiries({
    required String role,
    required String docId,
  });
  Future<QuerySnapshot<Map<String, dynamic>>> updateInquiry({
    required String role,
    required String docId,
    required String docIdInquiry,
  });
}
