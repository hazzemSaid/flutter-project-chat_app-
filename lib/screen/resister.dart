import 'package:chatapp/cubit/regestercubit.dart';
import 'package:chatapp/cubit/registerstate/regester_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '/screen/customebutton.dart';
import '/screen/cutometextfild.dart';
import 'chat_screen.dart';

class resister extends StatelessWidget {
  @override
  String? Email;

  String? pass;

  bool loading = false;

//using key to validate the form and save the data
//using email and password to store the data
//key show the error if the user enter the wrong data
  GlobalKey<FormState> form_key = GlobalKey();

  Widget build(BuildContext context) {
    return BlocConsumer<Regestercubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          loading = true;
        } else if (state is RegisterSuccess) {
          loading = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatScreen(
                        email: Email,
                        password: pass,
                      )));
        } else if (state is RegisterFailure) {
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
                key: form_key,
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
                        Text('Resister', style: TextStyle(fontSize: 30)),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    fild(
                        onchanged: (value) {
                          Email = value;
                        },
                        type: "Username"),
                    SizedBox(
                      height: 10,
                    ),
                    fild(
                        onchanged: (value) {
                          pass = value;
                        },
                        type: "Password"),
                    SizedBox(
                      height: 10,
                    ),
                    custombutton(
                        onTap: () {
                          if (form_key.currentState!.validate()) {
                            form_key.currentState!.save();
                            BlocProvider.of<Regestercubit>(context)
                                .rergester(email: Email!, password: pass!);
                          }
                        },
                        type: "Resister"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (' Already have an account?'),
                          style: TextStyle(fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          child: Text("sign in",
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
