import 'package:flutter/material.dart';

class Mylist extends StatelessWidget {
  const Mylist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                "Hello",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('Created on 11/10/2022'),
            );
          },
          separatorBuilder: (_, __) => Divider(height: 2),
          itemCount: 20),
    );
  }
}
