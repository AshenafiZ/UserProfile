import "package:flutter/material.dart";
import "package:flutter_app/core/theme/dark_theme.dart";
import "package:flutter_app/core/theme/light_theme.dart";

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.red[400],
    scaffoldBackgroundColor: Colors.white,
    textTheme: TLightTheme.textTheme,
    chipTheme: TLightTheme.chipTheme,
    appBarTheme: TLightTheme.appBarTheme,
    checkboxTheme: TLightTheme.checkboxTheme,
    bottomSheetTheme: TLightTheme.bottomSheetTheme,
    elevatedButtonTheme: TLightTheme.elevatedButtonTheme,
    outlinedButtonTheme: TLightTheme.outlinedButtonTheme,
    inputDecorationTheme: TLightTheme.inputDecorationTheme,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.greenAccent,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TDarkTheme.textTheme,
    chipTheme: TDarkTheme.chipTheme,
    appBarTheme: TDarkTheme.appBarTheme,
    checkboxTheme: TDarkTheme.checkboxTheme,
    bottomSheetTheme: TDarkTheme.bottomSheetTheme,
    elevatedButtonTheme: TDarkTheme.elevatedButtonTheme,
    outlinedButtonTheme: TDarkTheme.outlinedButtonTheme,
    inputDecorationTheme: TDarkTheme.inputDecorationTheme,
  );
}