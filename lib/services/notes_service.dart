import 'dart:convert';

import 'package:flutterpro/pages/pages/api_response.dart';
import 'package:flutterpro/pages/pages/pages_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': '2f5cd0b9-8016-42f7-91b6-a9c81fe0e7db'};
  Future<APIResponse<List<NotesL>>> getNotesList() {
    return http.get(Uri.parse(API + '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final notes = <NotesL>[];
        for (var item in jsonData) {
          final note = NotesL(
            noteId: item['noteID'],
            noteTitle: item['noteTitle'],
            CreatDateTime: DateTime.parse(item['CreateDateTime']),
            lastEditedDatetime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['"latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<NotesL>>(data: notes);
      }
      return APIResponse<List<NotesL>>(
          error: true, errorMessage: 'An Error on Occured');
    }).catchError(
      (_) => APIResponse<List<NotesL>>(
          error: true, errorMessage: 'An error occured'),
    );
  }
  //
}
