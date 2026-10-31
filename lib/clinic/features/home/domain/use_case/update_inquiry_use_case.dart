import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/repository/home_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class UpdateInquiryUseCase {
  final HomeRepository repository;
  UpdateInquiryUseCase({required this.repository});
  Future<AppResult<List<InquiryEntity>>> call({
    required String role,
    required String docId,
    required String docIdInquiry,
  }) async {
    return await repository.updateInquiry(
      role: role,
      docId: docId,
      docIdInquiry: docIdInquiry,
    );
  }
}
