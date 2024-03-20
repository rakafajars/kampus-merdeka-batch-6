import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';

class StartDoctorRatingWidget extends StatelessWidget {
  final double? height;
  final double? fontSize;
  final double? width;
  final double? sizeIcon;
  const StartDoctorRatingWidget({
    super.key,
    this.height, this.fontSize, this.width,
    this.sizeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 13,
      width:width ?? 28,
      decoration: BoxDecoration(
        color: ColorConstant.greyColor1,
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            size:sizeIcon ?? 10,
            color: ColorConstant.greenColor,
          ),
          Text(
            '4,7',
            style: TextStyleConstant.interMedium.copyWith(
              fontSize:fontSize ?? 8,
              color: ColorConstant.greenColor,
            ),
          )
        ],
      ),
    );
  }
}
