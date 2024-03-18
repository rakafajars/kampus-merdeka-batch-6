import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/home/widget/menu_home_widget.dart';

class ListMenuHomeWidget extends StatelessWidget {
  const ListMenuHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuHomeWidget(
          iconsData: Icons.person,
          title: 'Doctor',
        ),
        MenuHomeWidget(
          iconsData: Icons.medication,
          title: 'Pharmacy',
        ),
        MenuHomeWidget(
          iconsData: Icons.local_hospital,
          title: 'Hospital',
        ),
        MenuHomeWidget(
          iconsData: Icons.car_crash,
          title: 'Ambulance',
        )
      ],
    );
  }
}
