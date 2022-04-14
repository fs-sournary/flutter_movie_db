import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This function configures light [ThemeData] of the app.
ThemeData createLightThemeData(BuildContext context) => ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
    );

/// This function configures dark [ThemeData] of the app.
ThemeData createDarkThemeData(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.black,
    );
