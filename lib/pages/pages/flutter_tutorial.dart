import 'package:flutter/material.dart';

class ContentF extends StatefulWidget {
  const ContentF({super.key});

  @override
  State<ContentF> createState() => _ContentState();
}

class _ContentState extends State<ContentF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Some flutter key points",
          style: TextStyle(color: Color.fromARGB(181, 42, 238, 245)),
        ),
        backgroundColor: Color.fromARGB(255, 136, 115, 38),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.home_filled,
            color: Color.fromARGB(255, 21, 9, 92),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset("images/welcome2.png"),
          Divider(
            color: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
