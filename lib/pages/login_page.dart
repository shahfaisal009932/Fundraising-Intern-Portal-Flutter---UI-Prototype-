import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade700, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: isSignUp ? buildSignUp(size) : buildLogin(size),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogin(Size size) {
    return Column(
      key: const ValueKey('login'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back",
            style: GoogleFonts.poppins(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text("Fundraising Intern Portal",
            style: TextStyle(color: Colors.white70, fontSize: 16)),
        const SizedBox(height: 40),
        buildTextField("Email"),
        const SizedBox(height: 16),
        buildTextField("Password", obscure: true),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
            ),
            child: const Text("Login",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Don't have an account?",
                style: TextStyle(color: Colors.white70)),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignUp = true;
                });
              },
              child:
                  const Text("Sign Up", style: TextStyle(color: Colors.white)),
            )
          ],
        )
      ],
    );
  }

  Widget buildSignUp(Size size) {
    return Column(
      key: const ValueKey('signup'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Create Account",
            style: GoogleFonts.poppins(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text("Join as Fundraising Intern",
            style: TextStyle(color: Colors.white70, fontSize: 16)),
        const SizedBox(height: 40),
        buildTextField("Name"),
        const SizedBox(height: 16),
        buildTextField("Email"),
        const SizedBox(height: 16),
        buildTextField("Password", obscure: true),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
            ),
            child: const Text("Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Already have account?",
                style: TextStyle(color: Colors.white70)),
            TextButton(
              onPressed: () {
                setState(() {
                  isSignUp = false;
                });
              },
              child: const Text("Login", style: TextStyle(color: Colors.white)),
            )
          ],
        )
      ],
    );
  }

  Widget buildTextField(String label, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
