import 'dart:convert';

import 'package:flutterpro/pages/pages/api_response.dart';
import 'package:flutterpro/pages/pages/note.dart';
import 'package:flutterpro/pages/pages/note_insert.dart';
import 'package:flutterpro/pages/pages/pages_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://jsonplaceholder.typicode.com/users';
  //static const headers = {'apiKey': '2f5cd0b9-8016-42f7-91b6-a9c81fe0e7db'};
  Future<APIResponse<List<NotesL>>> getNotesList() {
    return http.get(Uri.parse(API)).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final notes = <NotesL>[];
        for (var item in jsonData) {
          notes.add(NotesL.fromJson(item));
        }
        return APIResponse<List<NotesL>>(data: notes);
      }
      return APIResponse<List<NotesL>>(
          error: true, errorMessage: 'An Error on Occured');
    }).catchError(
      (_) => APIResponse<List<NotesL>>(
        error: true,
        errorMessage:
            'An error occured\n Make sure you\'re connected to internet',
      ),
    );
  }

  //
  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(Uri.parse(API + '/' + noteID)).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(
          error: true, errorMessage: 'An Error on Occured');
    }).catchError(
      (_) => APIResponse<Note>(
        error: true,
        errorMessage:
            'An error occured\n Make sure you\'re connected to internet',
      ),
    );
  }

  Future<APIResponse<bool>> createNote(NoteInsert item) {
    return http.post(Uri.parse(API), body: item.toJson()).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(
          error: true, errorMessage: 'An Error on Occured');
    }).catchError(
      (_) => APIResponse<bool>(
        error: true,
        errorMessage:
            'An error occured\n Make sure you\'re connected to internet',
      ),
    );
  }
}
