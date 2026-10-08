import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';

class ProfileLocalDataSourceIml implements ProfileLocalDataSourse {
  @override
  List<ServiceType> getStaticServices() {
    return ServiceType.values;
  }

  @override
  List<WeekDays> getStaticWeekDays() {
    return WeekDays.values;
  }
}
