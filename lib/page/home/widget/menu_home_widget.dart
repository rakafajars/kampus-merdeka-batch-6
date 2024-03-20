import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuHomeWidget extends StatelessWidget {
  final String title;
  final IconData iconsData;
  const MenuHomeWidget({
    super.key,
    required this.title,
    required this.iconsData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16,
            ),
            color: ColorConstant.whiteColor,
          ),
          child: Icon(
            iconsData,
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.carme(
            fontSize: 14,
            color: ColorConstant.greyColor3,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
