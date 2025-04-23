import 'package:flutter/material.dart';

Widget customInputField({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  bool obscureText = false,
  String? hintText,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      hintText: hintText,
      labelStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      filled: true,
      fillColor: Theme.of(context).cardColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
