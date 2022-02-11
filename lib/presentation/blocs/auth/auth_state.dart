part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final String token;
  final String refreshToken;

  const AuthLoaded({required this.token, required this.refreshToken});
  @override
  List<Object> get props => [token, refreshToken];
}

class AuthError extends AuthState {
  final String errorType;

  const AuthError(this.errorType);

  @override
  List<Object> get props => [errorType];
}

class AuthLogoutLoaded extends AuthState{}