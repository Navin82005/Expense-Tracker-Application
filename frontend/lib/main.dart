import 'package:flutter/material.dart';
import 'package:frontend/controller/global_controller.dart';
import 'package:frontend/controller/login_controller.dart';
import 'package:frontend/controller/navigation_controller.dart';
import 'package:frontend/layout.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("userData");
  await Hive.openBox("wallet");
  // final dir = await getApplicationDocumentsDirectory();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final globalController = Get.put(GlobalController());

  final NavigationController navigationController =
      Get.put(NavigationController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4BC355)),
        useMaterial3: true,
      ).copyWith(
        splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
      ),
      home: const Layout(),
    );
  }
}
