import 'package:flutter/material.dart';
import 'package:frontend/core/style/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor.shade600,
    );
  }
}
