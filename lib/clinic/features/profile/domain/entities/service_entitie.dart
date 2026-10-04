enum ServiceType {
  preventive,
  restorative,
  oralSurgery,
  cosmeeticDentistry,
  orthodontics,
  prosthodontics,
  pedodontics,
}

class ServiceEntities {
  final String serviceName;
  final String doctorName;
  final bool status;
  ServiceEntities({
    this.serviceName = "",
    this.doctorName = "",
    this.status = false,
  });
}
