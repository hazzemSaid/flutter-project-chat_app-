import 'package:flutter/material.dart';
import '../constrain.dart';
import '/screen/cutometextfild.dart';
import '/screen/customebutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_screen.dart';

class sign_up extends StatefulWidget {
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  @override
  String? email;

  String? password;

  bool loading = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
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
                        loading = true;
                        setState(() {});
                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Sign in successful.")),
                          );
                          //Navigator.pushNamed(context!, ChatScreen.chatroute);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                email: email,
                                password: password,
                              ),
                            ),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("invalid email or passwor"),
                            ),
                          );
                        }
                      }
                      loading = false;
                      setState(() {});
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
                        Navigator.pushReplacementNamed(context, '/resister');
                      },
                      child: Text("Resister",
                          style:
                              TextStyle(fontSize: 20, color: Colors.blue[900])),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
