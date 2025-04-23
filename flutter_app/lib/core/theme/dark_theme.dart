import 'package:flutter/material.dart';

class TDarkTheme {
  TDarkTheme._();

  static const Color accentColor = Colors.greenAccent;

  static final textTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    titleLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    titleSmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.white),
    labelLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: accentColor,
      foregroundColor: Colors.black,
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static const appBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static final checkboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    fillColor: WidgetStateProperty.resolveWith((states) =>
      states.contains(WidgetState.selected) ? accentColor : Colors.transparent),
    checkColor: WidgetStateProperty.all(Colors.black),
  );

  static final chipTheme = ChipThemeData(
    backgroundColor: Colors.grey.shade800,
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: accentColor,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: Colors.black,
  );

  static final inputDecorationTheme = InputDecorationTheme(
    labelStyle: const TextStyle(fontSize: 14, color: Colors.white),
    hintStyle: const TextStyle(fontSize: 14, color: Colors.white70),
    floatingLabelStyle: TextStyle(color: accentColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(color: accentColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.orange),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: BorderSide(color: accentColor),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );

  static final dropdownTheme = DropdownMenuThemeData(
    inputDecorationTheme: inputDecorationTheme,
  );

  static final bottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}
