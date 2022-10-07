import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const WlecomePage(),
    );
  }
}

class WlecomePage extends StatelessWidget {
  const WlecomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello this is My homepage"),
        centerTitle: true,
        backgroundColor: Colors.green[500],
      ),
      body: Image.asset('images/welcome.png'),
    );
  }
}
