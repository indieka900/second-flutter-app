import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpro/pages/pages/profile.dart';
import 'pages/home_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int currentPage = 0;
  List<Widget> pages = [Homepage(), Profilepage()];
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
          style: TextStyle(
            color: Color.fromARGB(255, 37, 80, 74),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[500],
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Color.fromARGB(255, 8, 206, 24),
      //     ),
      //     onPressed: () {
      //       showDialog(
      //         context: context,
      //         builder: (context) => const AboutDialog(
      //           applicationIcon: FlutterLogo(),
      //           applicationLegalese: 'Legalese',
      //           applicationName: 'Joseph\'s Flutter App',
      //           applicationVersion: 'version1.0.5',
      //           children: [
      //             Text("This details were created by Joseph580"),
      //           ],
      //         ),
      //       );
      //     },
      //     child: const Text("App info"),
      //   ),
      // ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        splashColor: Colors.green[400],
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
