import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/color_constant.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';
import 'package:flutter_application_2/page/home/widget/header_row_item_widget.dart';

class ListArticleHomeWidget extends StatelessWidget {
  const ListArticleHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderRowItemWidget(
          title: 'Health article',
          onTap: () {
            print('ini Health article');
          },
        ),
        const SizedBox(height: 15),
        Column(
          children: List.generate(
            10,
            (index) => Container(
              width: double.infinity,
              height: 67,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 16,
              ),
              padding: const EdgeInsets.only(
                left: 6,
                right: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12,
                ),
                border: Border.all(
                  color: ColorConstant.greyColor1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          height: 46,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                                style: TextStyleConstant.interSemiBold.copyWith(
                                  fontSize: 10,
                                  color: ColorConstant.blackColor3,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Jun 10, 2021',
                                    style: TextStyleConstant.interMedium,
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: 2,
                                    width: 2,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorConstant.greyColor2,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '5min read',
                                    style: TextStyleConstant.interMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.bookmark,
                      color: ColorConstant.greenColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
