import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/repository/home_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class GetInquiriesUseCase {
  final HomeRepository repository;
  const GetInquiriesUseCase({required this.repository});
  Future<AppResult<List<InquiryEntity>>> call({
    required String role,
    required String docId,
  }) async {
    return await repository.getInquiries(role: role, docId: docId);
  }
}
