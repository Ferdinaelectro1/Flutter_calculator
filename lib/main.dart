import 'package:flutter/material.dart';
import 'package:calculatrice/homepage.dart';
import 'package:calculatrice/settings_page.dart';
import 'package:calculatrice/info_page.dart';

void main()
{
  runApp(Calculatrice());
}

class Calculatrice extends StatelessWidget
{

  const Calculatrice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.red),
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/settingsPage' : (context) => SettingsPage(),
        '/infoPage' : (context) => InfoPage(),
      },
    );
  }
}

