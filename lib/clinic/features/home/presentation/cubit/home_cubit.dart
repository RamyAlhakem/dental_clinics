import 'package:dental_clinics_app/clinic/features/home/domain/use_case/get_inquiries_use_case.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/use_case/home_use_case.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase homeUseCase;
  HomeCubit({required this.homeUseCase}) : super(HomeInitState());
  getInquiries({required String role, required String docId}) async {
    emit(HomeLoadingState(inquiries: []));
    final result = await homeUseCase.getInquiriesUseCase.call(
      role: role,
      docId: docId,
    );
    if (result.data != null) {
      emit(HomeLoadedState(inquiries: result.data!));
    } else {
      emit(HomeFailedState(msg: result.msg!));
    }
  }

  Future<bool> updateInquiry({
    required String role,
    required String docId,
    required String docIdInquiry,
  }) async {
    final currentInquiries = (state as HomeWithDataState).inquiries;
    emit(
      HomeLoadingInquiryState(
        inquiries: currentInquiries,
        docIdInquiry: docIdInquiry,
      ),
    );
    final result = await homeUseCase.updateInquiryUseCase.call(
      role: role,
      docId: docId,
      docIdInquiry: docIdInquiry,
    );
    if (result.data != null) {
      emit(HomeSuccessUpdateState(msg: result.msg!, inquiries: result.data!));
      return true;
    } else {
      emit(HomeFailedUpdateState(msg: result.msg!));
      return false;
    }
  }
}
