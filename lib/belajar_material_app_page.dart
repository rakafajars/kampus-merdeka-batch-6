import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BelajarMaterialAppPage extends StatelessWidget {
  const BelajarMaterialAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Belajar Drawer',
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Colors.amber,
        child: Column(
          children: [
            Text('Bank'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoSwitch(
              value: true,
              onChanged: (val) {},
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
