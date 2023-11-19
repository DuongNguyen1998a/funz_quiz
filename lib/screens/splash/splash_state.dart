part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;

  const SplashState({
    this.isLoading = false,
    this.isAuthenticated = false,
  });

  SplashState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }

  @override
  List<Object?> get props => [isLoading, isAuthenticated];
}
