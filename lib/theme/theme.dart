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