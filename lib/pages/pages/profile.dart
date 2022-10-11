import 'package:flutter/material.dart';
//import 'register.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int itemcount = 10;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemcount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            itemcount++;
            CheckboxListTile(value: true, onChanged: (bool? value) {});
          },
          contentPadding: EdgeInsets.all(8.0),
          title: Text('Person ${index + 1} '),
          subtitle: Text(
            "Message from Person ${index + 1} ",
            style: TextStyle(color: Colors.black),
          ),
          tileColor: Color.fromARGB(255, 127, 240, 185),
          //hoverColor: Colors.purple,
          textColor: Color.fromARGB(255, 135, 3, 158),
          leading: Icon(Icons.person_outline),
          trailing: Icon(Icons.delete_forever),
          iconColor: Colors.redAccent,
          onLongPress: () {
            setState(() {
              showDialog(
                context: context,
                builder: (context) => AboutDialog(
                  applicationName: 'Contact info',
                  children: [
                    Text('Hello Person ${index + 1}'),
                  ],
                ),
              );
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
