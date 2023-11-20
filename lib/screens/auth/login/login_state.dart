part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isLoginSuccess;
  final String error;

  const LoginState({
    this.isLoading = false,
    this.isLoginSuccess = false,
    this.error = '',
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isLoginSuccess,
    String? error,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, isLoginSuccess, error];
}
