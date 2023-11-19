part of 'login_bloc.dart';

abstract class LoginBlocState extends Equatable {
  const LoginBlocState();
}

class LoginBlocInitial extends LoginBlocState {
  @override
  List<Object> get props => [];
}
