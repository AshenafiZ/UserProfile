import 'package:flutter/material.dart';
Widget customCheckbox({
  required BuildContext context,
  required bool value,
  required ValueChanged<bool?> onChanged,
  required String label,
}) {
  return Row(
    children: [
      Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: Theme.of(context).colorScheme.secondary, // Accent color
        checkColor: Colors.white,
      ),
      Text(
        label,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
    ],
  );
}
