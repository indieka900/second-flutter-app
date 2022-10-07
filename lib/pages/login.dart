//import 'dart:html';

import 'package:flutter/material.dart';

class Nextpage extends StatelessWidget {
  const Nextpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 196, 150, 13),
      ),
      body: const Center(
        child: AboutListTile(
          icon: Icon(Icons.info),
          applicationIcon: FlutterLogo(),
          applicationLegalese: 'Legalese',
          applicationName: 'Joseph\'s Flutter App',
          applicationVersion: 'version1.0.5',
          aboutBoxChildren: [
            Text("Joseph Indieka"),
          ],
        ),
      ),
    );
  }
}
