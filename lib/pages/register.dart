import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.indigo[400],
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text(
          "Register Page",
          style: TextStyle(color: Color.fromARGB(255, 37, 80, 74)),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[500],
      ),
      body: Center(
        child: ElevatedButton(
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
      ),
    );
  }
}
