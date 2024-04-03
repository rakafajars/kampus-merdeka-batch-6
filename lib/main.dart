import 'package:flutter/material.dart';
import 'package:flutter_application_2/constant/name_routes.dart';
import 'package:flutter_application_2/gen/fonts.gen.dart';
import 'package:flutter_application_2/page/contact/archive_contact_page.dart';
import 'package:flutter_application_2/page/contact/create_edit_contact_page.dart';
import 'package:flutter_application_2/page/contact/home_contact_page.dart';
import 'package:flutter_application_2/page/contact_with_provider/archive_contact_with_provider_page.dart';
import 'package:flutter_application_2/page/contact_with_provider/contact_provider.dart';
import 'package:flutter_application_2/page/contact_with_provider/contact_with_provider_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ContactProvider>(
          create: (_) => ContactProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData.dark(), // standard dark theme
        themeMode: _themeMode,
        theme: ThemeData(
          fontFamily: FontFamily.poppins,
        ),
        initialRoute: NameRoutes.initRoute,
        routes: {
          NameRoutes.initRoute: (context) => const ContactWithProviderPage(),
          NameRoutes.archivePageRoute: (context) => const ArchiveContactWithProviderPage(),
          NameRoutes.createEditPageRoute: (context) =>
              const CreateEditContactPage(),
        },
      ),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
