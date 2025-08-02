import 'package:flutter/material.dart';

class RewardTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool unlocked;

  const RewardTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.unlocked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        unlocked ? Icons.emoji_events : Icons.lock_outline,
        color: unlocked ? Colors.amber : Colors.grey,
        size: 32,
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: unlocked
          ? Chip(
              label: const Text("Unlocked"),
              backgroundColor: Colors.green.shade100,
            )
          : const Text("Locked", style: TextStyle(color: Colors.grey)),
    );
  }
}
