import 'package:flutter/material.dart';

Widget customButton({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
  Color? backgroundColor,
  Color? textColor,
  IconData? icon,
  bool fullWidth = false,
  double borderRadius = 12,
  double paddingVertical = 14,
  double paddingHorizontal = 24,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w600,
  double? elevation,
}) {
  return SizedBox(
    width: fullWidth ? double.infinity : null,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: textColor ?? Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: elevation,
      ),
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: 18) : const SizedBox.shrink(),
      label: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      ),
    ),
  );
}
