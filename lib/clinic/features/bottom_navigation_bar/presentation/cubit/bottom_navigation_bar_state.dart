import 'package:equatable/equatable.dart';

sealed class BottomNavigationBarState extends Equatable {
  final int selectedIndex;
  const BottomNavigationBarState({required this.selectedIndex});
  @override
  List<Object?> get props => [selectedIndex];
}

class ChangingIndexState extends BottomNavigationBarState {
  const ChangingIndexState({required super.selectedIndex});
}
