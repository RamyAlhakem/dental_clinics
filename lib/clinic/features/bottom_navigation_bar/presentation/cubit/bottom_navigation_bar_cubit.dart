import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar/presentation/cubit/bottom_navigation_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(ChangingIndexState(selectedIndex: 0));
  selectIndex(int index) {
    emit(ChangingIndexState(selectedIndex: index));
  }
}
