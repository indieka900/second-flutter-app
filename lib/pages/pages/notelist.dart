import 'package:flutter/material.dart';
import 'package:flutterpro/pages/pages/delete.dart';
import 'package:flutterpro/pages/pages/note_modifier.dart';
import 'package:flutterpro/pages/pages/pages_for_listing.dart';

class Mylist extends StatelessWidget {
  Mylist({super.key});
  final notes = [
    new NotesL(
        noteId: '1',
        CreatDateTime: DateTime.now(),
        noteTitle: 'First Tasks',
        lastEditedDatetime: DateTime.now()),
    new NotesL(
        noteId: '2',
        CreatDateTime: DateTime.now(),
        noteTitle: 'Second Tasks',
        lastEditedDatetime: DateTime.now()),
    new NotesL(
        noteId: '3',
        CreatDateTime: DateTime.now(),
        noteTitle: 'Third Tasks',
        lastEditedDatetime: DateTime.now()),
    new NotesL(
        noteId: '4',
        CreatDateTime: DateTime.now(),
        noteTitle: 'Forth Tasks',
        lastEditedDatetime: DateTime.now()),
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Items"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return NoteModifier();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(notes[index].noteId),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async{
                final result = await showDialog(
                  context: context,
                  builder: (_) => OnDelete(),
                );
                return result;
              },
              child: ListTile(
                title: Text(
                  notes[index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return NoteModifier(
                          noteid: notes[index].noteId,
                        );
                      },
                    ),
                  );
                },
                subtitle: Text(
                    'Created on ${formatDateTime(notes[index].CreatDateTime)}'),
              ),
            );
          },
          separatorBuilder: (_, __) => Divider(height: 2),
          itemCount: notes.length),
    );
  }
}
