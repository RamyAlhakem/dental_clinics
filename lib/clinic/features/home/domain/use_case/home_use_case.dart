import 'package:dental_clinics_app/clinic/features/home/domain/use_case/get_inquiries_use_case.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/use_case/update_inquiry_use_case.dart';

class HomeUseCase {
  final GetInquiriesUseCase getInquiriesUseCase;
  final UpdateInquiryUseCase updateInquiryUseCase;
  HomeUseCase({
    required this.getInquiriesUseCase,
    required this.updateInquiryUseCase,
  });
}
