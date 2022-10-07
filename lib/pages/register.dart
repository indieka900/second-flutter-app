import 'package:flutter/material.dart';

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
        title: const Text("Register Page"),
        centerTitle: true,
        backgroundColor: Colors.amber[500],
      ),
      body: Center(
        child: ElevatedButton(
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
