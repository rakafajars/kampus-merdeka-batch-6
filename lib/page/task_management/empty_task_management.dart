import 'package:flutter/material.dart';

class EmptyTaskManagement extends StatefulWidget {
  const EmptyTaskManagement({super.key});

  @override
  State<EmptyTaskManagement> createState() => _EmptyTaskManagementState();
}

class _EmptyTaskManagementState extends State<EmptyTaskManagement> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Task Masih Kosong',
      ),
    );
  }
}
