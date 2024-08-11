import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/cubit/registerstate/regester_state.dart';

class Regestercubit extends Cubit<RegisterState> {
  Regestercubit() : super((RegisterInitial()));
  Future<void> rergester({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      var auth = await FirebaseAuth.instance;
      UserCredential userinfo = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      emit(RegisterSuccess());
    } on Exception catch (e) {
      emit(RegisterFailure(massage: e.toString()));
    }
  }
}
