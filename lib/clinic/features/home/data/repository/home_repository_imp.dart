import 'package:dental_clinics_app/clinic/features/home/data/data_source/remote_data/home_reomte_data_source.dart';
import 'package:dental_clinics_app/clinic/features/home/data/models/inquiry_model.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/repository/home_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeReomteDataSource homeReomteDataSource;
  const HomeRepositoryImp({required this.homeReomteDataSource});
  @override
  Future<AppResult<List<InquiryEntity>>> getInquiries({
    required String role,
    required String docId,
  }) async {
    try {
      final querySnapshot = await homeReomteDataSource.getInquiries(
        role: role,
        docId: docId,
      );
      final data = querySnapshot.docs.map((doc) {
        Map<String, dynamic> mapData = doc.data();
        mapData.addAll({"docIdInquiry": doc.id});

        return mapData;
      }).toList();
      List<InquiryModel> inquiries = data
          .map((inquiry) => InquiryModel.fromJson(inquiry))
          .toList();
      debugPrint("inquiries===============>>>>>>>>>>>>>>>>>>     >>  $data");
      return AppResult.success(inquiries);
    } on FirebaseException catch (e) {
      debugPrint(
        "inquiries Errorrrrrrrr ===============>>>>>>>>>>>>>>>>>>     >>  $e",
      );
      return AppResult.failure("Firebase error");
    } catch (e) {
      debugPrint(
        "inquiries unknown Errorrrrrrrr  docId $docId  role $role ===============>>>>>>>>>>>>>>>>>>     >>  $e",
      );
      return AppResult.failure("Unknown error");
    }
  }

  @override
  Future<AppResult<List<InquiryEntity>>> updateInquiry({
    required String role,
    required String docId,
    required String docIdInquiry,
  }) async {
    try {
      final querySnapshot = await homeReomteDataSource.updateInquiry(
        role: role,
        docId: docId,
        docIdInquiry: docIdInquiry,
      );
      final data = querySnapshot.docs.map((doc) {
        Map<String, dynamic> mapData = doc.data();
        mapData.addAll({"docIdInquiry": doc.id});

        return mapData;
      }).toList();
      List<InquiryModel> inquiries = data
          .map((inquiry) => InquiryModel.fromJson(inquiry))
          .toList();
      return AppResult.success(inquiries);
    } on FirebaseException catch (e) {
      return AppResult.failure("Error updated inquiry");
    } catch (e) {
      return AppResult.failure("Unknown error updated inquiry");
    }
  }
}
