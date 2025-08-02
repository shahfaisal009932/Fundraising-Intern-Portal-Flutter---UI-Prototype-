import 'package:flutter/material.dart';
import '../models/leaderboard_entry.dart';

class LeaderboardPage extends StatelessWidget {
  final List<LeaderboardEntry> entries = [
    LeaderboardEntry(name: "Aisha", amount: 12000),
    LeaderboardEntry(name: "Rohan", amount: 9500),
    LeaderboardEntry(name: "Shah Faisal", amount: 5000),
    LeaderboardEntry(name: "Neha", amount: 4200),
    LeaderboardEntry(name: "Manish", amount: 3000),
  ];

  LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaderboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: entries.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final e = entries[index];
            return ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.deepPurple.shade100,
                  child: Text("${index + 1}")),
              title: Text(e.name,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text("Raised ₹${e.amount}"),
              trailing: index == 0
                  ? const Icon(Icons.emoji_events, color: Colors.amber)
                  : null,
            );
          },
        ),
      ),
    );
  }
}
