import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      await Future.delayed(Duration(seconds: 2));

      if (email.isNotEmpty && password.isNotEmpty) {
        emit(AuthSuccess());
      } else {
        emit(AuthError("Please enter your email and password"));
      }
    } catch (e) {

      emit(AuthError("Something went wrong, please try again"));
    }
  }
}