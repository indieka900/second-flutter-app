class Note {
  var noteId;
  var noteTitle;
  var email;
  var phoneNumber;
  var website;
  var company;
  var username;
  var adress;

  Note({
    this.noteId,
    this.noteTitle,
    this.email,
    this.company,
    this.website,
    this.phoneNumber,
    this.username,
    this.adress,
  }) {}

  factory Note.fromJson(Map<String, dynamic> item) {
    return Note(
        noteId: item['id'].toString(),
        noteTitle: item['name'],
        email: item['email'],
        phoneNumber: item['phone'],
        website: item['website'],
        company: item['company'],
        username: item['username'],
        adress: item['address']
        // lastEditedDatetime: item['latestEditDateTime'] != null
        //     ? DateTime.parse(item['latestEditDateTime'])
        //     : null,
        );
  }
}
