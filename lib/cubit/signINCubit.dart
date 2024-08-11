import 'package:bloc/bloc.dart';
import 'package:chatapp/cubit/SignInstate/Singinstate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SginINCubite extends Cubit<SignInState> {
  SginINCubite() : super(SignInInitial());
  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      print(email);
      print('\n');
      print(password);
      //hazemsaid@gmail.com
      //01224661310
      var UserCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignInSuccess());
      print("done");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure(massage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure(massage: 'Wrong password provided for that user.'));
      } else
        emit(SignInFailure(massage: e.code));
    }
  }
}
