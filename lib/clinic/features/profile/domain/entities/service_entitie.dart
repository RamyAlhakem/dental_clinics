enum ServiceType {
  preventive,
  restorative,
  oralSurgery,
  cosmeeticDentistry,
  orthodontics,
  prosthodontics,
  pedodontics,
}

enum WeekDays { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

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
