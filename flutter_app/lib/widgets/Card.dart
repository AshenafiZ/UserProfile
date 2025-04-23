import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String imageUrl;
  final VoidCallback? onTap;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.role,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: colorScheme.primary.withOpacity(0.1),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(email, style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary)),
                  const SizedBox(height: 2),
                  Text(role, style: textTheme.bodySmall?.copyWith(color: colorScheme.primary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
