import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';

class ButtonGlobalWidget extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isWithBorder;
  final Color? borderColor;
  final Function()? onTap;
  const ButtonGlobalWidget({
    super.key,
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.isWithBorder = false,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 56,
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorConstant.greenColor,
          borderRadius: BorderRadius.circular(
            32,
          ),
          border: isWithBorder
              ? Border.all(
                  color: borderColor ?? ColorConstant.greenColor,
                )
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyleConstant.interSemiBold.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
