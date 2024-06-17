import 'package:chatapp/screen/chat_screen.dart';
import 'package:flutter/material.dart';
import 'screen/sgin_in.dart';
import 'screen/resister.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'screen/chat_screen.dart';
import 'theme/themes.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkmode,
      theme: lightmode,
      // home: sign_up(),
      routes: {
        '/': (context) => sign_up(),
        '/resister': (context) => resister(),
        // ChatScreen.chatroute: (context) => ChatScreen(),
      },
    );
  }
}
