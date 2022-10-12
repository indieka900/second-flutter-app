class NoteInsert {
  var id;
  var name;
  var username;
  var phone;

  NoteInsert({
    this.id,
    this.name,
    this.username,
    this.phone,
  }) {}

  Map<String, dynamic> toJson() {
    return {id: id, 'name': name, 'username': username, 'phone': phone};
  }
}
