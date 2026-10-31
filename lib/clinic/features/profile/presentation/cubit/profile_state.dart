import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

class ProfileState {
  final ServiceType? selectedService;
  final WeekDays? selectedDay;
  final AppointmentDuration? selectedDuration;
  final bool isEnabled;
  final bool enabledDay;
  final bool applyAll;

  final UserEntitie? user;
  const ProfileState({
    this.selectedService,
    required this.isEnabled,
    required this.enabledDay,
    required this.applyAll,
    required this.selectedDuration,
    this.user,
    this.selectedDay,
  });
}

class ChangingSelectedServiceState extends ProfileState {
  const ChangingSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
    required super.enabledDay,
    required super.applyAll,
    super.user,
    super.selectedDay,
    required super.selectedDuration,
  });
}

class ChangingSelectedDayState extends ProfileState {
  const ChangingSelectedDayState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.applyAll,
    required super.enabledDay,
    required super.selectedDuration,
  });
}

class InitiSelectedServiceState extends ProfileState {
  const InitiSelectedServiceState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.applyAll,
    required super.enabledDay,
    required super.selectedDuration,
  });
}

class LoadedUserInfoProfileState extends ProfileState {
  LoadedUserInfoProfileState({
    required ProfileState oldState,
    required UserEntitie user,
  }) : super(
         selectedDay: oldState.selectedDay,
         selectedDuration: oldState.selectedDuration,
         selectedService: oldState.selectedService,
         enabledDay: oldState.enabledDay,
         isEnabled: oldState.isEnabled,
         applyAll: oldState.applyAll,
         user: user,
       );
}

class SuccessUserInfoProfileState extends ProfileState {
  final String msg;
  SuccessUserInfoProfileState({
    required ProfileState oldState,
    required this.msg,
  }) : super(
         selectedDay: oldState.selectedDay,
         selectedService: oldState.selectedService,
         selectedDuration: oldState.selectedDuration,
         enabledDay: oldState.enabledDay,
         applyAll: oldState.applyAll,
         isEnabled: oldState.isEnabled,
         user: oldState.user,
       );
}

class SuccessDayProfileState extends ProfileState {
  final String msg;
  SuccessDayProfileState({required ProfileState oldState, required this.msg})
    : super(
        selectedDay: oldState.selectedDay,
        selectedDuration: oldState.selectedDuration,
        selectedService: oldState.selectedService,
        isEnabled: oldState.isEnabled,
        enabledDay: oldState.enabledDay,
        user: oldState.user,
        applyAll: oldState.applyAll,
      );
}

class LoadingUserInfoProfileState extends ProfileState {
  LoadingUserInfoProfileState(ProfileState oldState)
    : super(
        enabledDay: oldState.enabledDay,
        isEnabled: oldState.isEnabled,
        user: oldState.user,
        applyAll: oldState.applyAll,
        selectedDuration: oldState.selectedDuration,
        selectedDay: oldState.selectedDay,
        selectedService: oldState.selectedService,
      );
}

class LoadedDayUserInfoProfileState extends ProfileState {
  final DayScheduleEntities day;
  final List<SlotEntities> shifts;
  LoadedDayUserInfoProfileState({
    super.selectedService,
    required super.isEnabled,
    super.user,
    super.selectedDay,
    required super.enabledDay,
    required super.selectedDuration,
    required super.applyAll,
    required this.day,
    required this.shifts,
  });
}

class FailedUserInfoProfileState extends ProfileState {
  final String msg;
  FailedUserInfoProfileState({
    required ProfileState oldState,
    required this.msg,
  }) : super(
         selectedService: oldState.selectedService,
         selectedDuration: oldState.selectedDuration,
         selectedDay: oldState.selectedDay,
         user: oldState.user,
         applyAll: oldState.applyAll,
         enabledDay: oldState.enabledDay,
         isEnabled: oldState.isEnabled,
       );
}

class ChangeStartTimeProfileState extends ProfileState {
  ChangeStartTimeProfileState({
    super.selectedService,
    required super.isEnabled,
    required super.applyAll,

    super.user,
    super.selectedDay,
    required super.enabledDay,
    required super.selectedDuration,
  });
}

class ChangeEndTimeProfileState extends ProfileState {
  ChangeEndTimeProfileState({
    super.selectedService,
    required super.isEnabled,
    required super.applyAll,
    super.user,
    super.selectedDay,
    required super.enabledDay,
    required super.selectedDuration,
  });
}

class ChangeDurationProfileState extends ProfileState {
  ChangeDurationProfileState({
    super.selectedService,
    required super.isEnabled,
    required super.applyAll,
    super.user,
    super.selectedDay,
    required super.enabledDay,
    required super.selectedDuration,
  });
}

class ChangingApplyDayProfileState extends ProfileState {
  ChangingApplyDayProfileState({
    super.selectedService,
    required super.isEnabled,
    required super.applyAll,
    super.user,
    super.selectedDay,
    required super.enabledDay,
    required super.selectedDuration,
  });
}
