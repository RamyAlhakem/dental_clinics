import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';

class SlotModel extends SlotEntities {
  SlotModel({super.startTime, super.endTime});
  factory SlotModel.fromJson(Map<String, dynamic> json) {
    return SlotModel(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'startTime': startTime, 'endTime': endTime};
  }

  factory SlotModel.fromEntity(SlotEntities entity) {
    return SlotModel(startTime: entity.startTime, endTime: entity.endTime);
  }
}
