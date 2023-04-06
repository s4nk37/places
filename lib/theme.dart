import 'package:flutter/material.dart';

const sixtyColor = Color(0xffEAFDFC);
const thirtyColor = Color(0xff91D8E4);
const tenColor = Color(0xff6D67E4);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // textTheme: const TextTheme(bodyMedium: TextStyle())
  //     .apply(bodyColor: Colors.black54, displayColor: Colors.black54),
  primaryColor: const Color(0xff6D67E4),
  useMaterial3: true,
  elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(tenColor),
          foregroundColor: MaterialStatePropertyAll(Colors.white70),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(side: BorderSide.none)))),
  colorScheme: ColorScheme.fromSeed(
    seedColor: tenColor,
    brightness: Brightness.light,
    // primary: tenColor,
    // onPrimary: Colors.black,
    // secondary: thirtyColor,
    // onSecondary: Colors.black87,
    // error: Colors.red,
    // onError: Colors.white70,
    // background: sixtyColor,
    // onBackground: Colors.black54,
    // surface: tenColor,
    // onSurface: Colors.white70,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xff6D67E4),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(tenColor.withAlpha(100)),
          foregroundColor: MaterialStatePropertyAll(Colors.white70),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(side: BorderSide.none)))),
  colorScheme:
      ColorScheme.fromSeed(seedColor: tenColor, brightness: Brightness.dark),
);
