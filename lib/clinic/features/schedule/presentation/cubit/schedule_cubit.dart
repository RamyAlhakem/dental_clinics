import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/usecases/get_appointments_usecase.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/cubit/schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final GetAppointmentsUseCase getAppointmentsUseCase;

  ScheduleCubit({required this.getAppointmentsUseCase})
    : super(ScheduleInitial());

  Future<void> getAppointments({
    required String role,
    required String docId,
  }) async {
    emit(ScheduleLoading());
    final result = await getAppointmentsUseCase.call(role: role, docId: docId);

    if (result.data != null) {
      emit(ScheduleLoaded(result.data!));
    } else {
      emit(ScheduleError(result.msg ?? "An error occurred"));
    }
  }
}
