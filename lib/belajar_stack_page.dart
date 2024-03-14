import 'package:flutter/material.dart';

class BelajarStackPage extends StatelessWidget {
  const BelajarStackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.black,
            height: 400,
            width: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
            width: 100,
          ),
        ],
      ),
    );
  }
}
