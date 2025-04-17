import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String imageUrl;
  final VoidCallback? onTap;
  final Widget? trailing;

  const ProfileCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.imageUrl,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.grey[300],
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.grey[400] : Colors.black54,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
