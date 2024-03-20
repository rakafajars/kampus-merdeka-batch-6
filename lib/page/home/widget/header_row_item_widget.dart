import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/constant/color_constant.dart';

import '../../../constant/text_style_constant.dart';

class HeaderRowItemWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const HeaderRowItemWidget({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyleConstant.interSemiBold.copyWith(
              color: ColorConstant.blackColor1,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'See all',
              style: TextStyleConstant.interRegular.copyWith(
                color: ColorConstant.greenColor,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
