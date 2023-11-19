import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(const SplashState()) {
    debugPrint('[SplashBloc] init run');
    checkAuthenticated();
  }

  Future<void> checkAuthenticated() async {
    debugPrint('[SplashBloc] checkAuthenticated run');
    emit(state.copyWith(isLoading: true));
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        emit(state.copyWith(isLoading: false, isAuthenticated: true));
      } else {
        emit(state.copyWith(isLoading: false, isAuthenticated: false));
      }
    } catch (e) {
      debugPrint('[SplashBloc] checkAuthenticated error $e');
      emit(state.copyWith(isLoading: false, isAuthenticated: false));
    }
  }
}
