import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_bloc_state.dart';

class LoginBloc extends Cubit<LoginBlocState> {
  LoginBloc() : super(LoginBlocInitial());
}
