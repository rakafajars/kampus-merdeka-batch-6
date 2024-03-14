import 'package:flutter/material.dart';

class FlutterLayoutPage extends StatelessWidget {
  const FlutterLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Belajar Layout',
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Strobery',
                  ),
                  Text(
                    'asdjandnkajsnkjas',
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.stars,
                      ),
                      Text('170 Reviews')
                    ],
                  )
                ],
              ),
              Container(
                height: 500,
                width: 100,
                color: Colors.amber,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Strobery',
                  ),
                  Text(
                    'asdjandnkajsnkjas',
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.stars,
                      ),
                      Text('170 Reviews')
                    ],
                  )
                ],
              ),
              Container(
                height: 500,
                width: 100,
                color: Colors.amber,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Strobery',
                  ),
                  Text(
                    'asdjandnkajsnkjas',
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.stars,
                      ),
                      Text('170 Reviews')
                    ],
                  )
                ],
              ),
              Container(
                height: 500,
                width: 100,
                color: Colors.amber,
              )
            ],
          ),
        ],
      ),
    );
  }
}
