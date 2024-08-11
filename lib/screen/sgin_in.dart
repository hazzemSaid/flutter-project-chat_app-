import 'package:chatapp/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/screen/customebutton.dart';
import '/screen/cutometextfild.dart';
import 'chat_screen.dart';

class Sign_up extends StatelessWidget {
  String? email;
  bool loading = false;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // Sign_up({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          loading = true;
        } else if (state is SignInSuccess) {
          loading = false;

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                        email: email,
                        password: password,
                      )));
        } else if (state is SignInFailure) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.massage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Chat App'),
            ),
            drawer: const Drawer(
              child: IconButton(
                disabledColor: Colors.black,
                icon: Icon(Icons.logout),
                onPressed: null,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Image.asset('assets/images/scholar.png'),
                        Text("Chat App", style: TextStyle(fontSize: 50)),
                        SizedBox(
                          height: 100,
                        ),
                      ]),
                    ),
                    Row(
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    fild(
                        onchanged: (value) {
                          email = value;
                        },
                        type: "Username"),
                    SizedBox(
                      height: 10,
                    ),
                    fild(
                        onchanged: (value) {
                          password = value;
                        },
                        type: "Password"),
                    SizedBox(
                      height: 10,
                    ),
                    custombutton(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(login(
                              email: email!,
                              password: password!,
                            ));
                          }
                        },
                        type: "Sign up"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ('don\'t have an account?'),
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/resister');
                          },
                          child: Text("Resister",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blue[900])),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}






/*
class sign_up extends StatefulWidget {
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  @override
 
  Widget build(BuildContext context) {
   
  }
}
*/