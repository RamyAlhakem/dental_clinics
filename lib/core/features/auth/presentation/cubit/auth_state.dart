import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthSuccessResetPasswordState extends AuthState {}

class AuthFailedState extends AuthState {
  final String msg;
  AuthFailedState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
