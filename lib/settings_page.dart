import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget
{
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text("Page de paramètre"),
      ),
    );
  }
}