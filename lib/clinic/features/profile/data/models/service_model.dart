import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

class ServiceModel extends ServiceEntities {
  ServiceModel({super.serviceName, super.doctorName, super.status});
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      serviceName: json['serviceName'] as String,
      doctorName: json['doctorName'] as String,
      status: json['status'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'doctorName': doctorName,
      'status': status,
    };
  }
}
