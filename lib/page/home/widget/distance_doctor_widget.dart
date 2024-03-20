import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';

class DistanceDoctorWidget extends StatelessWidget {
  final double? fontSize;
  final double? iconSize;
  const DistanceDoctorWidget({
    super.key,
    this.fontSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.pin_drop,
          size: iconSize ?? 10,
          color: ColorConstant.greyColor2,
        ),
        Text(
          '800m away',
          style: TextStyleConstant.interMedium.copyWith(
            fontSize: fontSize ?? 8,
          ),
        )
      ],
    );
  }
}
