import 'package:flutter/material.dart';

class BelajarGridViewPage extends StatelessWidget {
  const BelajarGridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Belajar Grid View'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          10,
          (index) => Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text(
              'H',
            ),
          ),
        ),
      ),
    );
  }
}
