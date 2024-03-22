import 'package:flutter/material.dart';

class BannerHomeWidget extends StatelessWidget {
  const BannerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        image: const DecorationImage(
          image: NetworkImage(
            'https://img.freepik.com/free-vector/gradient-dental-clinic-sale-banner_23-2149666471.jpg?size=626&ext=jpg&ga=GA1.1.1803636316.1701302400&semt=ais',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
