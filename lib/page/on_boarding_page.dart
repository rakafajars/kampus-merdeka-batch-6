import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/page/home/home_page.dart';
import 'package:flutter_application_2/widget/button_global_widget.dart';
import 'package:flutter_application_2/widget/global_icon_logo_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: GlobalIconLogo(
              sizeIcon: 66,
              colorIcon: ColorConstant.greenColor,
              colorTextStyle: ColorConstant.greenColor,
              sizeText: 25,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Let’s get started!',
            style: TextStyleConstant.interBold,
          ),
          const Text(
            'Let’s get started!',
            style: TextStyle(
              fontFamily: FontFamily.poppins,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            'Login to enjoy the features we’ve\n provided, and stay healthy!',
            style: TextStyleConstant.interRegular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          ButtonGlobalWidget(
            title: 'Login',
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  (route) => false);
            },
          ),
          const SizedBox(height: 16),
          ButtonGlobalWidget(
            title: 'Sign Up',
            backgroundColor: ColorConstant.whiteColor,
            textColor: ColorConstant.greenColor,
            isWithBorder: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
