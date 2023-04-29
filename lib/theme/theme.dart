import 'package:flutter/material.dart';

ThemeData recordTheme = ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey.shade800;
          }
          else {
            return Colors.yellow;
          }
        }
      )
    )
  )
);

ThemeData lightThemeData = ThemeData(
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.tealAccent[700],
    ),
  )
);

ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.tealAccent[200],
    ),
  )
);
