import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';

class FormSearchHomeWidget extends StatelessWidget {
  const FormSearchHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstant.whiteColor,
        hintText: 'Search doctor, drugs, articles...',
        hintStyle: TextStyleConstant.interRegular.copyWith(
          fontSize: 12,
          color: ColorConstant.greyColor2,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: ColorConstant.greyColor2,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
          borderSide: BorderSide(
            color: ColorConstant.greyColor1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
          borderSide: BorderSide(
            color: ColorConstant.greenColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            24,
          ),
          borderSide: BorderSide(
            color: ColorConstant.greyColor1,
          ),
        ),
      ),
    );
  }
}
