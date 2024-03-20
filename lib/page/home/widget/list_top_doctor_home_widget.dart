import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/page/home/widget/distance_doctor_widget.dart';
import 'package:flutter_application_2/page/home/widget/header_row_item_widget.dart';
import 'package:flutter_application_2/page/home/widget/start_doctor_rating_widget.dart';
import 'package:flutter_application_2/page/top_doctor/top_doctor_page.dart';

import '../../../constant/text_style_constant.dart';

class ListTopDoctorHomeWidget extends StatelessWidget {
  const ListTopDoctorHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderRowItemWidget(
          title: 'Top Doctor',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TopDoctorPage(),
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 173,
          child: ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) {
              return Container(
                height: 173,
                width: 121,
                margin: const EdgeInsets.only(
                  right: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstant.greyColor1,
                  ),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 71,
                      width: 71,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/759087511356313604/OJ0w7WIS_400x400.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dr. Marcus Horizon',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyleConstant.interSemiBold.copyWith(
                              fontSize: 12,
                              color: ColorConstant.blackColor,
                            ),
                          ),
                          Text(
                            'Chardiologist',
                            style: TextStyleConstant.interMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StartDoctorRatingWidget(),
                              DistanceDoctorWidget(),
                              SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
