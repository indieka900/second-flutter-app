//import 'dart:html';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class Nextpage extends StatelessWidget {
  const Nextpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(188, 189, 42, 98),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text(
          "Login Page",
          style: TextStyle(
            color: Color.fromARGB(255, 104, 12, 9),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 13, 196, 13),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 8, 206, 24),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AboutDialog(
                  applicationIcon: FlutterLogo(),
                  applicationLegalese: 'Legalese',
                  applicationName: 'Joseph\'s Flutter App',
                  applicationVersion: 'version1.0.5',
                  children: [
                    Text("This details were created by Joseph580"),
                  ],
                ),
              );
            },
            child: const Text("App info"),
          ),
          Divider(
            thickness: 5,
            color: Colors.blueGrey,
          ),
          const Center(
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
        ],
      ),
    );
  }
}
