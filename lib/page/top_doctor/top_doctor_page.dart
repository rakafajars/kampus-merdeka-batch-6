import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';
import 'package:flutter_application_2/page/home/widget/distance_doctor_widget.dart';
import 'package:flutter_application_2/page/home/widget/start_doctor_rating_widget.dart';
import 'package:flutter_application_2/page/on_boarding_page.dart';
import 'package:flutter_application_2/page/splash_page.dart';

class TopDoctorPage extends StatelessWidget {
  const TopDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppBar(
        title: Text(
          'Top Doctor',
          style: TextStyleConstant.interSemiBold.copyWith(
            color: ColorConstant.blackColor1,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingPage(),
                  ),
                  (route) => false);
            },
            icon: Icon(
              Icons.menu,
              color: ColorConstant.blackColor1,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              height: 125,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorConstant.greyColor1,
                ),
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 111,
                    width: 111,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/759087511356313604/OJ0w7WIS_400x400.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dr. Marcus Horizon',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyleConstant.interSemiBold.copyWith(
                            fontSize: 18,
                            color: ColorConstant.blackColor,
                          ),
                        ),
                        Text(
                          'Chardiologist',
                          style: TextStyleConstant.interMedium.copyWith(
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 15),
                        const StartDoctorRatingWidget(
                          height: 18,
                          fontSize: 12,
                          width: 41,
                          sizeIcon: 14,
                        ),
                        const SizedBox(height: 8),
                        const DistanceDoctorWidget(
                          fontSize: 12,
                          iconSize: 10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
