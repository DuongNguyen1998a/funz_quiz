part of 'you_bloc.dart';

class YouState extends Equatable {
  final bool isLoading;
  final bool isLoadingSignOut;
  final bool isSignOutSuccess;
  final bool isLoadingDeleteAccount;
  final bool isDeleteAccountSuccess;
  final User? user;

  const YouState({
    this.isLoading = false,
    this.isLoadingSignOut = false,
    this.isSignOutSuccess = false,
    this.isLoadingDeleteAccount = false,
    this.isDeleteAccountSuccess = false,
    this.user,
  });

  YouState copyWith({
    bool? isLoading,
    bool? isLoadingSignOut,
    bool? isSignOutSuccess,
    bool? isLoadingDeleteAccount,
    bool? isDeleteAccountSuccess,
    User? user,
  }) {
    return YouState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingSignOut: isLoadingSignOut ?? this.isLoadingSignOut,
      isSignOutSuccess: isSignOutSuccess ?? this.isSignOutSuccess,
      isLoadingDeleteAccount: isLoadingDeleteAccount ?? this.isLoadingDeleteAccount,
      isDeleteAccountSuccess: isDeleteAccountSuccess ?? this.isDeleteAccountSuccess,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, isLoadingSignOut, isSignOutSuccess, isLoadingDeleteAccount, isDeleteAccountSuccess, user];
}
