import 'package:flutter/material.dart';
import 'package:hngx_first_project/screens/main_screen.dart';
import 'package:hngx_first_project/utils/constants.dart';
import 'package:hngx_first_project/utils/reuseables/custom_texts.dart';
import 'package:hngx_first_project/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: buildCustomCenterText(
            inputText: AppTexts.welcome,
            fontSize: 36,
            weight: FontWeight.bold,
            colorName: AppColor.primaryColor),
      ),
    );
  }
}
