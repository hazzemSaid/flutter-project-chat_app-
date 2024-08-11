import 'package:chatapp/bloc/auth_bloc.dart';
import 'package:chatapp/cubit/regestercubit.dart';
import 'package:chatapp/cubit/signINCubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'screen/resister.dart';
import 'screen/sgin_in.dart';
import 'theme/themes.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter binding is initialized

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SginINCubite>(create: (context) => SginINCubite()),
        BlocProvider<Regestercubit>(create: (context) => Regestercubit()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        darkTheme: darkmode,
        theme: lightmode,
        routes: {
          '/': (context) => Sign_up(),
          '/resister': (context) => resister(),
          // ChatScreen.chatroute: (context) => ChatScreen(),
        },
      ),
    );
  }
}
