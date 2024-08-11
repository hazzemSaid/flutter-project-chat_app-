import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen/chat_screen.dart';
import '/screen/cutometextfild.dart';
import '/screen/customebutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIN {
  String? Email;
  String? pass;
  GlobalKey<FormState> key;
  BuildContext? context;
  bool loading;
  final Function laod;
  SignIN(
      {required this.loading,
      required this.laod,
      required this.key,
      required this.context,
      required this.Email,
      required this.pass});
  void Resgsister_User() async {
    var auth = await FirebaseAuth.instance;
    if (key.currentState!.validate()) {
      laod(true);
      try {
        UserCredential userinfo = await auth.createUserWithEmailAndPassword(
            email: Email!, password: pass!);
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            content: Text("Resisterd successfully"),
          ),
        );
        Navigator.push(
          context!,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              email: Email,
              password: pass,
            ),
          ),
        );
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context!).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                children: [
                  Icon(
                    Icons.error,
                    size: 10,
                  ),
                  Text(
                    "The password provided is too weak.",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context!).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                children: [
                  Icon(
                    Icons.error,
                    size: 10,
                  ),
                  Text(
                    "The email address is already in use by another account.",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context!).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                children: [
                  Icon(
                    Icons.error,
                    size: 10,
                  ),
                  Text(
                    "error in resistering user",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
          content: Text("error in resistering user"),
        ),
      );
    }
    laod(false);

    // print(userinfo.user!.email);
  }
}
