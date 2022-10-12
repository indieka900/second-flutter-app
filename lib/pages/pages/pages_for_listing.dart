class NotesL {
  var noteId;
  var noteTitle;
  var email;
  var phoneNumber;
  var website;
  var company;

  NotesL(
      {this.noteId,
      this.noteTitle,
      this.email,
      this.company,
      this.website,
      this.phoneNumber}) {}
  factory NotesL.fromJson(Map<String, dynamic> item) {
    return NotesL(
        noteId: item['id'].toString(),
        noteTitle: item['name'],
        email: item['email'],
        phoneNumber: item['phone'],
        website: item['website'],
        company: item['company']
        // lastEditedDatetime: item['latestEditDateTime'] != null
        //     ? DateTime.parse(item['latestEditDateTime'])
        //     : null,
        );
  }
}
