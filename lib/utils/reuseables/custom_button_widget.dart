import 'package:flutter/material.dart';
import 'package:hngx_first_project/utils/reuseables/custom_texts.dart';
import 'package:hngx_first_project/utils/size_config.dart';

class BuildCustomButton extends StatelessWidget {
  const BuildCustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonTextSize,
    required this.buttonTextColor,
    required this.buttonColor,
    required this.borderColor,
    required this.buttonTextWeight,
  });

  final void Function()? onPressed;
  final String buttonText;
  final double buttonTextSize;
  final Color buttonTextColor;
  final Color buttonColor;
  final Color borderColor;
  final FontWeight buttonTextWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(48),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: borderColor))),
        child: buildCustomText(
            inputText: buttonText,
            fontSize: buttonTextSize,
            weight: buttonTextWeight,
            colorName: buttonTextColor),
      ),
    );
  }
}
