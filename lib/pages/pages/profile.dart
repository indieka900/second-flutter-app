import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Person ${index + 1} '),
          tileColor: Color.fromARGB(255, 127, 240, 185),
          //hoverColor: Colors.purple,
          textColor: Color.fromARGB(255, 135, 3, 158),
          leading: Icon(Icons.person_outline),
          trailing: Icon(Icons.delete_forever),
          iconColor: Colors.redAccent,
          onTap: () {
            setState(() {
              Icon(Icons.select_all_rounded);
            });
          },
          //selected: true,
          //mouseCursor: ,
        );
      },
    );
  }
}
