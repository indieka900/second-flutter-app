import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'package:flutter/services.dart';

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
        backgroundColor: Colors.brown,
      ),
      home: const WelcomePage(),
    );
  }
}

// String imagePath1 = 'images/welcome2.png';
// String imagePath2 = 'images/welcome.png';
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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.greenAccent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: const Text(
          "Welcome to our homepage",
          style: TextStyle(color: Color.fromARGB(255, 53, 7, 219)),
        ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown[600]),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const Register();
                        }),
                      );
                      // setState(() {
                      //   if (currentPath == imagePath1) {
                      //     currentPath = imagePath2;
                      //   } else {
                      //     currentPath = imagePath1;
                      //   }
                      // });
                    },
                    child: const Text("Register"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo[600]),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return const Nextpage();
                        }),
                      );
                      // setState(() {
                      //   currentNumbeOfimage++;
                      // });
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.red[600],
              //   ),
              //   onPressed: () {
              //     // setState(() {
              //     //   if (currentNumbeOfimage > 1) {
              //     //     currentNumbeOfimage--;
              //     //   } else {
              //     //     currentNumbeOfimage = 1;
              //     //   }
              //     // });
              //   },
              //   child: const Text("Remove image"),
              // ),
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
