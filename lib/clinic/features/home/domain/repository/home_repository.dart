import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

abstract class HomeRepository {
  Future<AppResult<List<InquiryEntity>>> getInquiries({
    required String role,
    required String docId,
  });
  Future<AppResult<List<InquiryEntity>>> updateInquiry({
    required String role,
    required String docId,
    required String docIdInquiry,
  });
}
