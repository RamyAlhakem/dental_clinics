import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';

class InquiryModel extends InquiryEntity {
  const InquiryModel({
    super.docIdInquiry,
    super.patientId,
    super.patientName,
    super.inquiry,
    super.phone,
    super.replied,
  });
  factory InquiryModel.fromJson(Map<String, dynamic> json) {
    return InquiryModel(
      docIdInquiry: json['docIdInquiry'],
      patientId: json['patientId'],
      patientName: json['patientName'],
      inquiry: json['inquiry'],
      phone: json['phone'],
      replied: json['replied'],
    );
  }
}
