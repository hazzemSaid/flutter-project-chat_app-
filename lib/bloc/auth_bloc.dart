import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is login) {
        emit(SignInLoading());
        try {
          print(event.email);
          print('\n');
          print(event.password);
          //hazemsaid@gmail.com
          //01224661310
          var UserCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(SignInSuccess());
          print("done");
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(SignInFailure(massage: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(SignInFailure(
                massage: 'Wrong password provided for that user.'));
          } else
            emit(SignInFailure(massage: e.code));
        }
      }
      if (event is register) {
        print("register");
        return;
      }
    });
  }
}
