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

  //get name => _apiResponse!.company;
  //String name;
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
      _isLoading = false;
    });
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
      body: Builder(
        builder: (_) {
          if (_isLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(200, 52, 248, 3),
                //value: 2,
                semanticsLabel: "Loading..",
                backgroundColor: Color.fromARGB(255, 221, 35, 35),
              ),
            );
          }
          if (_apiResponse!.error) {
            return Center(
              child: Text(_apiResponse!.errorMessage!),
            );
          }
          return ListView.separated(
              itemBuilder: (_, index) {
                return Dismissible(
                  key: ValueKey(_apiResponse!.data![index].noteId),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    //_apiResponse.data.removeAt(index);
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
                      '${_apiResponse!.data![index].noteId}. ${_apiResponse!.data![index].noteTitle}',
                      style: TextStyle(color: Color.fromARGB(255, 26, 1, 248)),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return NoteModifier(
                              noteid: _apiResponse!.data![index].noteId,
                            );
                          },
                        ),
                      );
                    },
                    subtitle: Text(
                      '''
    email: ${_apiResponse!.data![index].email}
    phone number: ${_apiResponse!.data![index].phoneNumber}
    company name: ${_apiResponse!.data![index].company['name']}''',
                      style: TextStyle(color: Color.fromARGB(255, 83, 7, 80)),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(height: 2),
              itemCount: _apiResponse!.data!.length);
        },
      ),
    );
  }
}
