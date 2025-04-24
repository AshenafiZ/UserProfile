import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? hint;
  final String? label;
  final bool isExpanded;
  final Widget? icon;
  final FormFieldValidator<T>? validator;

  const Dropdown({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.label,
    this.isExpanded = true,
    this.icon,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
      child: DropdownButtonFormField<T>(
        value: value,
        isExpanded: isExpanded,
        onChanged: onChanged,
        validator: validator,
        icon: icon ??
            Icon(
              Icons.arrow_drop_down,
              color: colorScheme.primary,
            ),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          border: Theme.of(context).inputDecorationTheme.border,
          floatingLabelStyle: Theme.of(context).inputDecorationTheme.floatingLabelStyle,
          labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        ),
        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        items: items,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
      ),
    );
  }
}
