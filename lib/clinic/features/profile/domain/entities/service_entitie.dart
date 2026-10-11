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

enum AppointmentDuration {
  fifteenMinutes(mints: 15, label: "15min"),
  thirtyMinutes(mints: 30, label: "30min"),
  fortyMinutes(mints: 40, label: "40min"),
  sixtyMinutes(mints: 60, label: "60min");

  final int mints;
  final String label;
  const AppointmentDuration({required this.mints, required this.label});
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
