import 'package:flutter/material.dart';

class BelajarExpandedPage extends StatelessWidget {
  const BelajarExpandedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Expanded'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ExpandedItem(),
                FlexibleItem(),
              ],
            ),
            Row(
              children: [
                ExpandedItem(),
                FlexibleItem(),
              ],
            ),
            Row(
              children: [
                ExpandedItem(),
                FlexibleItem(),
              ],
            ),
            Row(
              children: [
                ExpandedItem(),
                FlexibleItem(),
              ],
            ),
            Row(
              children: [
                ExpandedItem(),
                FlexibleItem(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedItem extends StatelessWidget {
  const ExpandedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Expanded',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class FlexibleItem extends StatelessWidget {
  const FlexibleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: const Text(
          'Flexible',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
