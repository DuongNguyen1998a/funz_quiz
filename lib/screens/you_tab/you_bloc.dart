import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'you_state.dart';

class YouBloc extends Cubit<YouState> {
  YouBloc() : super(const YouState()) {
    debugPrint('[YouBloc] init run');
    getUser();
  }

  Future<void> getUser() async {
    debugPrint('[YouBloc] getUser run');
    emit(state.copyWith(isLoading: true));
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(state.copyWith(isLoading: false, user: user));
      } else {
        emit(state.copyWith(isLoading: false, user: null));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, user: null));
      debugPrint('[YouBloc] getUser error $e');
    }
  }

  Future<void> signOut() async {
    debugPrint('[YouBloc] signOut run');
    emit(state.copyWith(isLoadingSignOut: true));
    try {
      await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(isLoadingSignOut: false, isSignOutSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoadingSignOut: false, isSignOutSuccess: false));
      debugPrint('[YouBloc] signOut error $e');
    }
  }

  Future<void> deleteAccount() async {
    debugPrint('[YouBloc] deleteAccount run');
    emit(state.copyWith(isLoadingSignOut: true));
    try {
      await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(isLoadingSignOut: false, isSignOutSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoadingSignOut: false, isSignOutSuccess: false));
      debugPrint('[YouBloc] deleteAccount error $e');
    }
  }
}
