import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'Bazartech';

  static ThemeData get theme => ThemeData(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 250, 244, 211),
          secondary: Color.fromARGB(255, 0, 70, 67),
          surface: Color(0xFF0C1618),
          background: Color(0xFF0C1618),
          error: Color.fromARGB(255, 255, 75, 75),
          onPrimary: Color.fromARGB(255, 0, 70, 67),
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Color(0xFF0C1618),
          brightness: Brightness.dark,
        ),
      );
}
