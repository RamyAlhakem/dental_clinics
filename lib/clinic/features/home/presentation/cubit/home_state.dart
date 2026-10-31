import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';

class HomeState {}

class HomeInitState extends HomeState {}

class HomeWithDataState extends HomeState {
  final List<InquiryEntity> inquiries;
  HomeWithDataState({required this.inquiries});
}

class HomeLoadingState extends HomeWithDataState {
  HomeLoadingState({required super.inquiries});
}

class HomeLoadingInquiryState extends HomeWithDataState {
  final String docIdInquiry;
  HomeLoadingInquiryState({
    required super.inquiries,
    required this.docIdInquiry,
  });
}

class HomeFailedUpdateState extends HomeState {
  final String msg;
  HomeFailedUpdateState({required this.msg});
}

class HomeLoadedState extends HomeWithDataState {
  HomeLoadedState({required super.inquiries});
}

class HomeSuccessUpdateState extends HomeWithDataState {
  final String msg;
  HomeSuccessUpdateState({required this.msg, required super.inquiries});
}

class HomeFailedState extends HomeState {
  final String msg;
  HomeFailedState({required this.msg});
}
