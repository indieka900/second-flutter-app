import 'package:flutter/material.dart';

class OnDelete extends StatelessWidget {
  const OnDelete({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning"),
      content: Text('Are you sure you want to delete this note?'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('Yes'),
        )
      ],
    );
  }
}
