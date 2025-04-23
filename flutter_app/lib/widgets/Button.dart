import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isExpanded;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isOutlined = false,
    this.isExpanded = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: 8),
        ],
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );

    final button = isOutlined
        ? OutlinedButton(
            onPressed: onPressed,
            child: child,
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: child,
          );

    return isExpanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
