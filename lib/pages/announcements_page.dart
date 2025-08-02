import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  final List<Map<String, String>> announcements = [
    {
      "title": "Welcome Interns!",
      "body":
          "Round 1 task is live. Submit your GitHub repo link before 5th August, 11:59 PM."
    },
    {
      "title": "Bonus Challenge",
      "body":
          "Add animated transitions to your UI and get extra visibility in shortlisting."
    },
    {
      "title": "WhatsApp Channel",
      "body":
          "Join the official channel to get all updates. No DMs or emails will be used."
    },
  ];

  AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Announcements"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: announcements.length,
        itemBuilder: (context, i) {
          final ann = announcements[i];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ann["title"]!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(ann["body"]!),
                  ]),
            ),
          );
        },
      ),
    );
  }
}
