import 'package:flutter/material.dart';
import 'package:hngx_first_project/utils/constants.dart';
import 'package:hngx_first_project/utils/reuseables/custom_button_widget.dart';
import 'package:hngx_first_project/utils/reuseables/custom_texts.dart';
import 'package:hngx_first_project/utils/size_config.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(25),
            horizontal: getProportionateScreenWidth(25)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: getProportionateScreenWidth(100),
              backgroundColor: AppColor.primaryColor,
              backgroundImage: AssetImage(AppImages.myProfileImage),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildCustomText(
                inputText: AppTexts.myName,
                fontSize: 20,
                weight: FontWeight.w900,
                colorName: AppColor.primaryColor),
                const Spacer(),
            BuildCustomButton(
                onPressed: () {},
                buttonText: AppTexts.openGit,
                buttonTextSize: 18,
                buttonTextColor: AppColor.generalWhite,
                buttonColor: AppColor.primaryColor,
                borderColor: AppColor.primaryColor,
                buttonTextWeight: FontWeight.bold)
          ],
        ),
      )),
    );
  }
}
