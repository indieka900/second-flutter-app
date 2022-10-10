import 'package:flutter/material.dart';
import 'flutter_tutorial.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ContentF();
              },
            ),
          );
          //debugPrint("Clicked elevated button");
        },
        child: Text("Flutter Short tutorial"),
      ),
    );
  }
}
