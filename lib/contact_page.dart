import 'package:flutter/material.dart';

// sample data for list view
const data = [
  {"username": "PurplePenguin22", "phone": "(555) 123-4567"},
  {"username": "GreenGiraffe99", "phone": "(555) 234-5678"},
  {"username": "SilverSunshine11", "phone": "(555) 345-6789"},
  {"username": "BlueButterfly44", "phone": "(555) 456-7890"},
  {"username": "GoldenDragonfly77", "phone": "(555) 567-8901"},
  {"username": "RedRainbow66", "phone": "(555) 678-9012"},
  {"username": "OrangeMeadow55", "phone": "(555) 789-0123"},
  {"username": "YellowNightfall33", "phone": "(555) 890-1234"},
  {"username": "BlackStarlight88", "phone": "(555) 901-2345"},
  {"username": "PinkMoonstone77", "phone": "(555) 012-3456"}
];

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Page',
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return itemContact(
            username: data[index]["username"] ?? "-",
            phone: data[index]["phone"] ?? "-",
          );
        },
      ),
    );
  }

  Widget itemContact({
    required String username,
    required String phone,
  }) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          username[0],
        ),
      ),
      title: Text(
        username,
      ),
      subtitle: Text(
        phone,
      ),
    );
  }
}
