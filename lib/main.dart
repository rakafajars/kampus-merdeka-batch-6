import 'package:flutter/material.dart';
import 'package:flutter_application_2/balajar_color_picker.dart';
import 'package:flutter_application_2/belajar_file_picker.dart';
import 'package:flutter_application_2/belajar_image_picker.dart';
import 'package:flutter_application_2/constant/name_routes.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/page/splash_page.dart';
import 'package:flutter_application_2/page/task_management/create_task_management.dart';
import 'package:flutter_application_2/page/task_management/detail_task_management.dart';
import 'package:flutter_application_2/page/task_management/home_task_management.dart';
import 'package:intl/date_symbol_data_local.dart';

Color currentColor = Colors.orange;
Color? selectedPicker;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(), // standard dark theme
      themeMode: _themeMode,
      theme: ThemeData(
        fontFamily: FontFamily.poppins,
      ),
      // home: const HomeTaskManagement(),
      initialRoute: NameRoutes.initRoute,
      routes: {
        NameRoutes.initRoute: (context) => const HomeTaskManagement(),
        NameRoutes.createTaskPage: (context) => const CreateTaskManagement(),
        NameRoutes.detailTaskPage: (context) => const DetailTaskManagement(),
      },
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
