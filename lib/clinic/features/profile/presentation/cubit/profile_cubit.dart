import 'package:dental_clinics_app/clinic/features/profile/data/models/schedule_days_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileCubit({required this.profileUseCase})
    : super(
        InitiSelectedServiceState(
          selectedService: null,
          isEnabled: false,
          enabledDay: false,
          user: null,
          selectedDay: null,
          selectedDuration: AppointmentDuration.thirtyMinutes,
        ),
      );
  selectService(ServiceType service) {
    emit(
      ChangingSelectedServiceState(
        selectedService: service,
        isEnabled: state.isEnabled,
        enabledDay: state.enabledDay,
        user: state.user,
        selectedDay: state.selectedDay,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  selectDay(WeekDays day) {
    emit(
      ChangingSelectedDayState(
        selectedService: state.selectedService,
        isEnabled: state.isEnabled,
        user: state.user,
        selectedDay: day,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  selectDuration(AppointmentDuration duration) {
    emit(
      ChangeDurationProfileState(
        selectedService: state.selectedService,
        isEnabled: state.isEnabled,
        user: state.user,
        selectedDay: state.selectedDay,
        enabledDay: state.enabledDay,
        selectedDuration: duration,
      ),
    );
  }

  setStartTime() {
    emit(
      ChangeStartTimeProfileState(
        isEnabled: state.isEnabled,
        enabledDay: state.enabledDay,
        selectedDay: state.selectedDay,
        selectedService: state.selectedService,
        user: state.user,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  setEndTime() {
    emit(
      ChangeEndTimeProfileState(
        isEnabled: state.isEnabled,
        enabledDay: state.enabledDay,
        selectedDay: state.selectedDay,
        selectedService: state.selectedService,
        user: state.user,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  changeSwitch(bool val) {
    emit(
      ChangingSelectedServiceState(
        isEnabled: val,
        selectedService: state.selectedService,
        user: state.user,
        selectedDay: state.selectedDay,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  changeEnabledDay(bool val) {
    emit(
      ChangingSelectedServiceState(
        isEnabled: state.isEnabled,
        selectedService: state.selectedService,
        user: state.user,
        selectedDay: state.selectedDay,
        enabledDay: val,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  clearData() {
    emit(
      InitiSelectedServiceState(
        isEnabled: false,
        selectedService: null,
        user: state.user,
        selectedDay: state.selectedDay,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  setData({required bool status, required ServiceType selectedService}) {
    emit(
      InitiSelectedServiceState(
        isEnabled: status,
        selectedService: selectedService,
        user: state.user,
        selectedDay: state.selectedDay,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
  }

  getInfo({required String role, required String userId}) async {
    emit(
      LoadingUserInfoProfileState(
        isEnabled: state.isEnabled,
        selectedService: state.selectedService,
        user: state.user,
        selectedDay: state.selectedDay,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
    final result = await profileUseCase.getInfoUseCase.call(
      role: role,
      userId: userId,
    );
    if (result.data != null) {
      emit(
        LoadedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          user: result.data!,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    } else {
      emit(
        FailedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.msg!,
          user: state.user,
          selectedDay: state.selectedDay,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    }
  }

  addNewService({
    required String role,
    required String docId,
    required ServiceModel service,
  }) async {
    emit(
      LoadingUserInfoProfileState(
        isEnabled: state.isEnabled,
        selectedService: state.selectedService,
        user: state.user,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
    final result = await profileUseCase.addNewServiceUseCase.call(
      role: role,
      docId: docId,
      service: service,
    );
    if (result.data != null) {
      emit(
        SuccessUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.data!,
          user: state.user,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    } else {
      emit(
        FailedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.msg!,
          user: state.user,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    }
  }

  saveDay({
    required String role,
    required String docId,
    required ScheduleDaysModels scheduleDay,
  }) async {
    emit(
      LoadingUserInfoProfileState(
        isEnabled: state.isEnabled,
        selectedService: state.selectedService,
        user: state.user,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
    final result = await profileUseCase.saveDayUseCase.call(
      role: role,
      docId: docId,
      scheduleDay: scheduleDay,
    );
    if (result.data != null) {
      emit(
        SuccessUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.data!,
          user: state.user,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    } else {
      emit(
        FailedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.msg!,
          user: state.user,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    }
  }

  editService({
    required String role,
    required String docId,
    required ServiceModel service,
    required ServiceModel newService,
  }) async {
    emit(
      LoadingUserInfoProfileState(
        isEnabled: state.isEnabled,
        selectedService: state.selectedService,
        user: state.user,
        enabledDay: state.enabledDay,
        selectedDuration: state.selectedDuration,
      ),
    );
    final result = await profileUseCase.editServiceUseCase.call(
      role: role,
      docId: docId,
      service: service,
      newService: newService,
    );
    if (result.data != null) {
      emit(
        SuccessUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.data!,
          user: state.user,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    } else {
      emit(
        FailedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.msg!,
          user: state.user,
          enabledDay: state.enabledDay,
          selectedDuration: state.selectedDuration,
        ),
      );
    }
  }
}
