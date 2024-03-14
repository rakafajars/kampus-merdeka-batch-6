import 'package:flutter/cupertino.dart';

class BelajarCupertinoPage extends StatelessWidget {
  const BelajarCupertinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Text('halo')
      ),
      child: Center(
        child: Text(
          'Halo',
        ),
      ),
    );
  }
}
