import 'package:flutter/material.dart';

class EmptyContactWidget extends StatelessWidget {
  const EmptyContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.contact_phone,
            size: 64,
          ),
          Text(
            'Contact Belum Ada',
          )
        ],
      ),
    );
  }
}
