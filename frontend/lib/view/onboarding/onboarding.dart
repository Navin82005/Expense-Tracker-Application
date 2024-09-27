import 'package:flutter/material.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/core/config/app_config.dart';
import 'package:frontend/core/style/typography.dart';
import 'package:frontend/view/login/create_account.dart';
import 'package:frontend/view/widget/primary_button.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  final data = [
    [
      "onboarding-1.png",
      "Take Control of Your Finances",
      "Empower yourself financially with ${AppConfig.appName}!",
      "Our intuitive app makes it easy to track your income, expenses, and budget - all in one place."
    ],
    [
      "onboarding-2.png",
      "Budgeting Made Simple",
      "We help you categorize your spending, identify areas to save, and stay on top of your financial goals.",
      ""
    ],
    [
      "onboarding-3.png",
      "Connect",
      "Save time and gain valuable insights by securely connecting your accounts to ${AppConfig.appName}.",
      " Enjoy automatic transaction tracking and a holistic view of your finances."
    ]
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => Get.off(const CreateAccount()),
            child: Text(
              _currentIndex != 2 ? "Skip" : "Done",
              style: CustomTypography.subHead1.copyWith(
                color: const Color(0xFF666666),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) => {
                  setState(() {
                    _currentIndex = index;
                  }),
                },
                controller: _pageController,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images/${data[index][0]}",
                          height: 300,
                          width: 350,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        data[index][1],
                        style: CustomTypography.heading4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        data[index][2],
                        textAlign: TextAlign.center,
                        style: CustomTypography.body2,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        data[index][3],
                        textAlign: TextAlign.center,
                        style: CustomTypography.body2,
                      ),
                    ],
                  );
                },
              ),
            ),
            // const Spacer(),
            const SizedBox(height: 16),
            renderPageTags(),
            const SizedBox(height: 42),
            PrimaryButton(
              onPressed: () {
                if (_currentIndex != 2) {
                  setState(() {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.bounceIn,
                    );
                  });
                } else {
                  Get.off(() => const CreateAccount());
                }
              },
              text: _currentIndex != 2
                  ? "Continue"
                  : "Start tracking your money!",
            ),
          ],
        ),
      ),
    );
  }

  Row renderPageTags() {
    List<Widget> tags = [];
    for (var i = 0; i < 3; i++) {
      tags += [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: _currentIndex == i ? 50 : 25,
          height: 8,
          decoration: BoxDecoration(
            color: _currentIndex == i
                ? const Color(0xFF4BC355)
                : const Color(0xFFDDDDDD),
            borderRadius: BorderRadius.circular(8),
          ),
        )
      ];
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [...tags],
    );
  }
}
