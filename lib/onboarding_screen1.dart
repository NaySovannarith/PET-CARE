import 'package:flutter/material.dart';
import 'package:pet_care1/onboarding_screen2.dart';
import '../widgets/dot_indicator.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset('assets/puppy11.jpg', fit: BoxFit.cover),
          ),
          // Bottom content
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      DotIndicator(isActive: true),
                      DotIndicator(),
                      DotIndicator(),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Hey! Welcome',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'while you sit and stay – we’ll go\nout and play',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  const SizedBox(height: 12),

                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingScreen1(),
                          ),
                        );
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
