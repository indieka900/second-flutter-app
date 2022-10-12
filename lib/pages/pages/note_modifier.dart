import 'package:flutter/material.dart';
import 'package:flutterpro/pages/pages/note_insert.dart';
import 'package:flutterpro/services/notes_service.dart';
import 'package:get_it/get_it.dart';

import 'note.dart';

class NoteModifier extends StatefulWidget {
  //const NoteModifier({super.key});
  var noteid;
  NoteModifier({this.noteid}) {}

  @override
  State<NoteModifier> createState() => _NoteModifierState();
}

class _NoteModifierState extends State<NoteModifier> {
  bool get isEditting => widget.noteid != null;
  bool _isLoading = false;

  var errormes;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  NotesService get notesService => GetIt.I<NotesService>();

  Note? note;

  @override
  void initState() {
    if (isEditting) {
      setState(() {
        _isLoading = true;
      });
      notesService.getNote(widget.noteid).then((response) {
        setState(() {
          _isLoading = false;
        });
        if (response.error) {
          errormes = response.errorMessage ?? 'An error occured';
        }
        note = response.data;
        _nameController.text = note!.noteTitle;
        _streetController.text = note!.adress['street'];
        _usernameController.text = note!.username;
        _emailController.text = note!.email;
        _phoneController.text = note!.phoneNumber;
        _cityController.text = note!.adress['city'];
      });
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditting ? 'Edit Note' : "Create Note "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _isLoading
            ? Center(
                child: LinearProgressIndicator(
                  color: Color.fromARGB(255, 221, 82, 18),
                  backgroundColor: Color.fromARGB(255, 12, 2, 145),
                ),
              )
            : Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'Full name'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(hintText: 'Username'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _cityController,
                    decoration: InputDecoration(hintText: 'City'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _streetController,
                    decoration: InputDecoration(hintText: 'Street'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(hintText: 'Phone number'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (isEditting) {
                          //edit
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                          final note = NoteInsert(
                            name: _nameController,
                            phone: _phoneController,
                            username: _usernameController,
                          );
                          final result = await notesService.createNote(note);
                          setState(() {
                            _isLoading = false;
                          });
                          final title = 'Done';
                          final err = result.error
                              ? (result.errorMessage ?? 'An error occured')
                              : 'Done Succesfully';
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(title),
                              content: Text(err),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'),
                                )
                              ],
                            ),
                          ).then((data) {
                            if (result.data!) {
                              Navigator.of(context).pop();
                            }
                          });
                        }
                      },
                      child: Text('Submit'),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
