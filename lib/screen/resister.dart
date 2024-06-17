import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/screen/cutometextfild.dart';
import '/screen/customebutton.dart';
import '/services/auth_regsister.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class resister extends StatefulWidget {
  @override
  State<resister> createState() => _resisterState();
}

class _resisterState extends State<resister> {
  @override
  String? Email;

  String? pass;

  bool loading = false;
  void laod(bool val) {
    setState(() {
      loading = val;
    });
  }

//using key to validate the form and save the data
//using email and password to store the data
//key show the error if the user enter the wrong data
  GlobalKey<FormState> form_key = GlobalKey();

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
                      regsister(
                              loading: loading,
                              laod: laod,
                              key: form_key,
                              context: context,
                              Email: Email,
                              pass: pass)
                          .Resgsister_User();
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
