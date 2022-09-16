import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      fontFamily: '0',
      primarySwatch: Colors.blue,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
            brightness: Brightness.dark,
          ),
    );
  }
}
