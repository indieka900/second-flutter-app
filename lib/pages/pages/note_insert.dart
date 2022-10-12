import 'package:flutter/foundation.dart';

class NoteInsert {
  var id;
  var name;
  var username;
  var phone;

  NoteInsert({
    @required this.id,
    @required this.name,
    @required this.username,
    @required this.phone,
  }) {}

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'username': username, 'phone': phone};
  }
}
