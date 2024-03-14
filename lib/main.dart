import 'package:flutter/material.dart';
import 'package:flutter_application_2/belajar_expanded_page.dart';
import 'package:flutter_application_2/belajar_grid_view_page.dart';
import 'package:flutter_application_2/belajar_list_view_biasa_page.dart';
import 'package:flutter_application_2/belajar_stack_page.dart';
import 'package:flutter_application_2/contact_page.dart';
import 'package:flutter_application_2/flutter_layout_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ContactPage(),
    );
  }
}
