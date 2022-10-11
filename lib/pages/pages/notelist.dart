import 'package:flutter/material.dart';
import 'package:flutterpro/pages/pages/api_response.dart';
import 'package:flutterpro/pages/pages/delete.dart';
import 'package:flutterpro/pages/pages/note_modifier.dart';
import 'package:flutterpro/pages/pages/pages_for_listing.dart';
import 'package:flutterpro/services/notes_service.dart';
import 'package:get_it/get_it.dart';

class Mylist extends StatefulWidget {
  Mylist({super.key});

  @override
  State<Mylist> createState() => _MylistState();
}

class _MylistState extends State<Mylist> {
  NotesService get service => GetIt.I<NotesService>();
  APIResponse<List<NotesL>>? _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesList();

    setState(() {
      _isLoading = true;
    });
  }

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
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                notes.removeAt(index);
              },
              confirmDismiss: (direction) async {
                final result = await showDialog(
                  context: context,
                  builder: (_) => OnDelete(),
                );
                return result;
              },
              background: Container(
                color: Colors.redAccent,
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  child: Icon(Icons.delete),
                  alignment: Alignment.centerLeft,
                ),
              ),
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
