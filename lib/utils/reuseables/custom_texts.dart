import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hngx_first_project/utils/size_config.dart';

Text buildCustomText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    style: GoogleFonts.inter(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}

Text buildCustomCenterText({
  required String inputText,
  required double fontSize,
  required FontWeight weight,
  required Color colorName,
}) {
  return Text(
    inputText,
    textAlign: TextAlign.center,
    style: GoogleFonts.inter(
        fontSize: getProportionateScreenWidth(fontSize),
        fontWeight: weight,
        color: colorName),
  );
}

