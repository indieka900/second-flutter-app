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
String currentPath = 'images/welcome.png';
//String imagePath2 = 'images/whallpaper2.png';

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
          statusBarColor: Color.fromARGB(255, 51, 78, 2),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: Row(
          children: [
            Image.asset(
              'images/icons.png',
              scale: 2,
            ),
            const Text(
              "Welcome to our homepage",
              style: TextStyle(
                color: Color.fromARGB(255, 53, 7, 219),
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[600],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15.0,
                ),
                Divider(
                  color: Color.fromARGB(255, 1, 31, 29),
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 3.0,
                          color: Color.fromARGB(255, 127, 161, 184),
                        ),
                        backgroundColor: Colors.brown[600],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
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
                        backgroundColor: Colors.indigo[600],
                        side: BorderSide(
                          width: 3.0,
                          color: Color.fromARGB(255, 131, 41, 53),
                        ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const Nextpage();
                          }),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color.fromARGB(255, 71, 48, 48),
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 3.0,
                          color: Color.fromARGB(255, 102, 231, 108),
                        ),
                        backgroundColor: Color.fromARGB(255, 10, 139, 122),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          currentNumbeOfimage++;
                        });
                      },
                      child: const Text("Add image"),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // VerticalDivider(
                    //   color: Colors.black,
                    //   thickness: 2,
                    //   width: 20,
                    //   indent: 200,
                    //   endIndent: 200,
                    // ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          width: 3.0,
                          color: Color.fromARGB(255, 231, 102, 167),
                        ),
                        backgroundColor: Colors.red[600],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (currentNumbeOfimage > 1) {
                            currentNumbeOfimage--;
                          } else {
                            currentNumbeOfimage = 1;
                          }
                        });
                      },
                      child: const Text("Remove image"),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromARGB(255, 49, 28, 28),
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                const SizedBox(
                  height: 25,
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
      ),
    );
  }
}
