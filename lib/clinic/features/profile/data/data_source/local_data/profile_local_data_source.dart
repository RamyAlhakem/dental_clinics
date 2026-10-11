import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

abstract class ProfileLocalDataSourse {
  List<ServiceType> getStaticServices();
  List<WeekDays> getStaticWeekDays();
  List<AppointmentDuration> getStaticDurations();
}
