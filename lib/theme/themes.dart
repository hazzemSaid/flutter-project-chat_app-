import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  primaryColor: Colors.grey[300],
  colorScheme: ColorScheme.light(),
  secondaryHeaderColor: Colors.grey[600],
  fontFamily: "OverpassRegular",
  brightness: Brightness.light,
);

ThemeData darkmode = ThemeData(
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  secondaryHeaderColor: const Color.fromARGB(255, 33, 33, 33),
  fontFamily: "OverpassRegular",
  brightness: Brightness.dark,
);
