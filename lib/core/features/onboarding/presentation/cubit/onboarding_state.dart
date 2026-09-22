import 'package:equatable/equatable.dart';

sealed class OnboardingState extends Equatable {
  final int index;
  const OnboardingState({required this.index});
  @override
  List<Object?> get props => [index];
}

class ChangingIndexState extends OnboardingState {
  const ChangingIndexState({required super.index});
}
