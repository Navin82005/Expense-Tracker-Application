import 'package:flutter/material.dart';
import 'package:frontend/view/home/home.dart';
import 'package:frontend/view/login/create_account.dart';
import 'package:frontend/view/onboarding/onboarding.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4BC355)),
        useMaterial3: true,
      ),
      // home: const CreateAccount(),
      // home: const OnboardingPage(),
      home: const Home(),
    );
  }
}
