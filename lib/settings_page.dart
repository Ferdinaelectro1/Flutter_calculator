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
        child: ListView(
          children: [
            ListTile(
              title: Text("Thème"),
              tileColor: Colors.redAccent,
              leading: Icon(Icons.brightness_6),
              onTap: () {
                // Action pour changer le thème
              },
            ),
            Divider(),
            ListTile(
              title: Text("Langue"),
              tileColor: Colors.redAccent,
              leading: Icon(Icons.language),
              onTap: () {
                // Action pour changer la langue
              },
            ),
            Divider(),
            ListTile(
              title: Text("Notifications"),
              tileColor: Colors.redAccent,
              leading: Icon(Icons.notifications),
              onTap: () {
                // Action pour gérer les notifications
              },
            ),
          ],
        ),
      ),
    );
  }
}