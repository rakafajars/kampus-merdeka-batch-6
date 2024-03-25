import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/text_style_constant.dart';
import 'package:flutter_application_2/gen/assets.gen.dart';

class GlobalIconLogo extends StatelessWidget {
  final Color? colorIcon;
  final Color? colorTextStyle;
  final double? sizeIcon;
  final double? sizeText;
  const GlobalIconLogo({
    super.key,
    this.colorIcon,
    this.colorTextStyle,
    this.sizeIcon,
    this.sizeText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.image.logoPng.image(
          height: sizeIcon ?? 129,
          width: sizeIcon ?? 129,
          color: colorIcon,
        ),
        Text(
          'Medics',
          style: TextStyleConstant.montSerratBold.copyWith(
            fontSize: sizeText ?? 50,
            color: colorTextStyle,
          ),
        )
      ],
    );
  }
}
