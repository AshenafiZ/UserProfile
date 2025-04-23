import 'package:flutter/material.dart';
Widget customTooltip({
  required BuildContext context,
  required String message,
  required Widget child,
}) {
  return Tooltip(
    message: message,
    child: child,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: TextStyle(color: Colors.white),
  );
}
