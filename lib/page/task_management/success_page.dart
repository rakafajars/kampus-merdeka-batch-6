import 'package:flutter/material.dart';
import 'package:flutter_application_2/page/task_management/home_task_management.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Success Page',
        ),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeTaskManagement()),
            (route) => false,
          );
        },
        child: const Text('Halaman home'),
      ),
    );
  }
}
