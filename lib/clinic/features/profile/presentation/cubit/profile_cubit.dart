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
          user: null,
        ),
      );
  selectService(ServiceType service) {
    emit(
      ChangingSelectedServiceState(
        selectedService: service,
        isEnabled: state.isEnabled,
        user: state.user,
      ),
    );
  }

  changeSwitch(bool val) {
    emit(
      ChangingSelectedServiceState(
        isEnabled: val,
        selectedService: state.selectedService,
        user: state.user,
      ),
    );
  }

  clearData() {
    emit(
      InitiSelectedServiceState(
        isEnabled: false,
        selectedService: null,
        user: state.user,
      ),
    );
  }

  getInfo({required String role, required String userId}) async {
    emit(
      LoadingUserInfoProfileState(
        isEnabled: state.isEnabled,
        selectedService: state.selectedService,
        user: state.user,
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
        ),
      );
    } else {
      emit(
        FailedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.msg!,
          user: state.user,
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
        ),
      );
    } else {
      emit(
        FailedUserInfoProfileState(
          isEnabled: state.isEnabled,
          selectedService: state.selectedService,
          msg: result.msg!,
          user: state.user,
        ),
      );
    }
  }
}
