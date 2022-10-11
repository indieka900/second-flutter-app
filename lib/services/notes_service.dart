import 'package:flutterpro/pages/pages/pages_for_listing.dart';

class NotesService {
  List<NotesL> getNotesList() {
    return [
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
  }
  //
}
