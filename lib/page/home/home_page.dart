import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';
import 'package:flutter_application_2/page/home/widget/banner_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/form_search_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/header_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/list_article_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/list_menu_home_widget.dart';
import 'package:flutter_application_2/page/home/widget/list_top_doctor_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    HeaderHomeWidget(),
                    SizedBox(height: 20),
                    FormSearchHomeWidget(),
                    SizedBox(height: 12),
                    ListMenuHomeWidget(),
                    SizedBox(height: 15),
                    BannerHomeWidget(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              ListTopDoctorHomeWidget(),
              SizedBox(height: 20),
              ListArticleHomeWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
