import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';
import 'package:flutter_application_2/page/home/widget/banner_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/form_search_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/header_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/list_menu_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor.withOpacity(0.9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const HeaderHomeWidget(),
                const SizedBox(height: 20),
                const FormSearchHomeWidget(),
                const SizedBox(height: 12),
                const ListMenuHomeWidget(),
                const SizedBox(height: 15),
                const BannerHomeWidget(),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Doctor',
                          style: TextStyleConstant.interSemiBold.copyWith(
                            color: ColorConstant.blackColor1,
                          ),
                        ),
                        Text(
                          'See all',
                          style: TextStyleConstant.interRegular.copyWith(
                            color: ColorConstant.greenColor,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
