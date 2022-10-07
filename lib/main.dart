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
      home: const WelcomePage(),
    );
  }
}

String imagePath1 = 'images/welcome2.png';
String imagePath2 = 'images/welcome.png';
String currentPath = 'images/whallpaper2.png';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentNumbeOfimage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to our homepage"),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[600]),
                onPressed: () {
                  setState(() {
                    if (currentPath == imagePath1) {
                      currentPath = imagePath2;
                    } else {
                      currentPath = imagePath1;
                    }
                  });
                },
                child: const Text("CLick"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo[600]),
                onPressed: () {
                  setState(() {
                    currentNumbeOfimage++;
                  });
                },
                child: const Text("Add image"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[600],
                ),
                onPressed: () {
                  setState(() {
                    if (currentNumbeOfimage > 2) {
                      currentNumbeOfimage--;
                    } else {
                      currentNumbeOfimage = 2;
                      const Text("There is no image to remove");
                    }
                  });
                },
                child: const Text("Remove image"),
              ),
              const SizedBox(
                height: 45,
              ),
              //Image.asset(currentPath),
              //Image.asset('images/welcome2.png'),
              Column(
                children: List.generate(
                    currentNumbeOfimage, (index) => Image.asset(currentPath)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
