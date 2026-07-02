import 'package:flutter/material.dart';
import 'dart:async';
import 'package:habithub/views/Authentication_Module/welcome_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  int filledBoxes = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // Animation Timer
    timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        filledBoxes = (filledBoxes + 1) % 5;
      });
    });

    // Navigation Timer
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeView()),
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // HabitHub Background

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              // Logo
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/logo.png', fit: BoxFit.contain),
              ),

              const SizedBox(height: 24),

              // App Name
              const Text(
                'HabitHub',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 8),

              // Tagline
              const Text(
                'Build Better. Every Day.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFCBD5E1),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 40),

              // Contribution Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(0),
                  const SizedBox(width: 8),
                  _buildBox(1),
                  const SizedBox(width: 8),
                  _buildBox(2),
                  const SizedBox(width: 8),
                  _buildBox(3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Contribution Box Widget
  Widget _buildBox(int index) {
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: index < filledBoxes
            ? const Color(0xFF22C55E) // Green
            : const Color(0xFF334155), // Gray
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
