import 'package:flutter/cupertino.dart';
import 'package:flutter_application_2/belajar_cupertino_page.dart';

class MyCupertino extends StatelessWidget {
  const MyCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: BelajarCupertinoPage(),
    );
  }
}
