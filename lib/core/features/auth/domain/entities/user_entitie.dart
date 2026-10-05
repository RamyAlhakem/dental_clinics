import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

class UserEntitie {
  final String docId;
  final String id;
  final String email;
  final String name;
  final String phone;
  final List<ServiceEntities> services;
  const UserEntitie({
    this.email = "",
    this.phone = "",
    this.name = "",
    this.id = "",
    this.docId = "",
    this.services = const [],
  });
}
