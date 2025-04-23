import "package:flutter/material.dart";
import "package:flutter_app/core/theme/dark_theme.dart";
import "package:flutter_app/core/theme/light_theme.dart";

class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    colorScheme: ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.orangeAccent,
      onPrimary: Colors.blueAccent,
      onSurface: Colors.black,
      
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TLightTheme.textTheme,
    chipTheme: TLightTheme.chipTheme,
    cardColor: Colors.grey.shade100,
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
    primaryColor: Colors.tealAccent,
    colorScheme: ColorScheme.dark(
      primary: Colors.tealAccent,
      onPrimary: const Color(0xFF05D370),
      secondary: Colors.deepOrangeAccent,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TDarkTheme.textTheme,
    cardColor: const Color.fromARGB(84, 158, 158, 158),
    chipTheme: TDarkTheme.chipTheme,
    appBarTheme: TDarkTheme.appBarTheme,
    checkboxTheme: TDarkTheme.checkboxTheme,
    bottomSheetTheme: TDarkTheme.bottomSheetTheme,
    elevatedButtonTheme: TDarkTheme.elevatedButtonTheme,
    outlinedButtonTheme: TDarkTheme.outlinedButtonTheme,
    inputDecorationTheme: TDarkTheme.inputDecorationTheme,
  );
}
