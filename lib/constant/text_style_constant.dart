import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConstant {
  static TextStyle montSerratBold = GoogleFonts.montserrat(
    fontSize: 24,
    color: ColorConstant.whiteColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle interBold = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: ColorConstant.blackColor1,
  );

  static TextStyle interRegular = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorConstant.blackColor2,
  );

    static TextStyle interSemiBold = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorConstant.whiteColor,
  );
}
