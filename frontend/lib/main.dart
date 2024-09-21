import 'package:flutter/material.dart';
import 'package:frontend/view/onbarding/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4BC355)),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
