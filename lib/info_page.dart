import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget 
{
  const InfoPage({super.key});

  @override
  State<InfoPage> createState()
  {
    return InfoPageState();
  }
}

class InfoPageState extends State<InfoPage>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("À propos"),
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
             title: Text("Calculatrice Flutter"),
             tileColor: Colors.redAccent, 
            ),
            ListTile(
              title: Text("Version 1.0.0"),
              tileColor: Colors.redAccent,
            ),  
            ListTile(
             title: Text("Développé par ATI Tchaa-sousso Ferdinand"),
             tileColor: Colors.redAccent, 
            ),
          ],
        ),
      ),
    );
  }
}