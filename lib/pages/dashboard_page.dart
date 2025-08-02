import 'package:flutter/material.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/reward_tile.dart';

class DashboardPage extends StatelessWidget {
  final String internName = "Shah Faisal";
  final String referralCode = "faisal2025";
  final int totalDonations = 5000;

  final List<Map<String, dynamic>> rewards = [
    {"title": "First ₹1,000", "subtitle": "Welcome badge", "unlocked": true},
    {"title": "₹5,000 Milestone", "subtitle": "Silver Medal", "unlocked": true},
    {"title": "Top Fundraiser", "subtitle": "Gold Trophy", "unlocked": false},
  ];

  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/leaderboard');
              },
              icon: const Icon(Icons.leaderboard)),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/announcements');
              },
              icon: const Icon(Icons.campaign)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, $internName",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text("Referral Code: $referralCode",
                style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 24),
            // Stats cards
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    title: "Total Raised",
                    value: "₹$totalDonations",
                    icon: Icons.attach_money,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: DashboardCard(
                    title: "Referrals",
                    value: "3",
                    icon: Icons.group,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text("Rewards / Unlockables",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ...rewards.map((r) => RewardTile(
                  title: r["title"],
                  subtitle: r["subtitle"],
                  unlocked: r["unlocked"],
                )),
          ],
        ),
      ),
    );
  }
}
