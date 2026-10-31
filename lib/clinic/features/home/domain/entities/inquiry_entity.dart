class InquiryEntity {
  final String docIdInquiry;
  final String patientId;
  final String patientName;
  final String inquiry;
  final String phone;
  final bool replied;
  const InquiryEntity({
    this.docIdInquiry = "",
    this.patientId = "",
    this.patientName = "",
    this.inquiry = "",
    this.phone = "",
    this.replied = false,
  });
}
