import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Input.dart';
class CustomTextArea extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int maxLines;

  const CustomTextArea({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 4,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      label: label,
      controller: controller,
    );
  }
}
