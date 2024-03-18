import 'package:flutter/material.dart';

class BannerHomeWidget extends StatelessWidget {
  const BannerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 135,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(
          12,
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3366FF),
            Color(0xFF00CCFF),
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
