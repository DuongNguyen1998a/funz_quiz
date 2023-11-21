import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState()) {
    debugPrint('[LoginBloc] init run');
  }

  Future<void> googleLogin() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        debugPrint('[LoginBloc] googleLogin run');
        emit(state.copyWith(isLoading: true));

        final rs = await auth.signInWithCredential(credential);

        if (rs.credential?.accessToken != null) {
          emit(state.copyWith(isLoading: false, isLoginSuccess: true, error: ''));
        } else {
          emit(state.copyWith(isLoading: false, isLoginSuccess: false, error: ''));
        }
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('[LoginBloc] googleLogin error with firebase $e');
      if (e.code == 'account-exists-with-different-credential') {
        emit(state.copyWith(isLoading: false, error: e.message ?? '', isLoginSuccess: false));
      } else if (e.code == 'invalid-credential') {
        emit(state.copyWith(isLoading: false, error: e.message ?? '', isLoginSuccess: false));
      }
    } catch (e) {
      debugPrint('[LoginBloc] googleLogin error $e');
      emit(state.copyWith(isLoading: false, error: 'Unknown error, please try again.', isLoginSuccess: false));
    }
  }
}
