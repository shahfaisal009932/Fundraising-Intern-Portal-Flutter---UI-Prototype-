import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/leaderboard_page.dart';
import 'pages/announcements_page.dart';

void main() {
  runApp(FundraisingInternPortal());
}

class FundraisingInternPortal extends StatelessWidget {
  const FundraisingInternPortal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intern Portal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/dashboard':
            return PageTransition(
              child: DashboardPage(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/leaderboard':
            return PageTransition(
              child: LeaderboardPage(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/announcements':
            return PageTransition(
              child: AnnouncementsPage(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          default:
            return null;
        }
      },
    );
  }
}
