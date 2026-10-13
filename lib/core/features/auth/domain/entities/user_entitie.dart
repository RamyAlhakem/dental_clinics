import 'package:dental_clinics_app/clinic/features/profile/domain/entities/schedule_days_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

class UserEntitie {
  final String docId;
  final String id;
  final String email;
  final String name;
  final String phone;
  final List<ServiceEntities> services;
  final ScheduleDaysEntites schedule;
  const UserEntitie({
    this.email = "",
    this.phone = "",
    this.name = "",
    this.id = "",
    this.docId = "",
    this.services = const [],
    this.schedule = const ScheduleDaysEntites(),
  });
}
