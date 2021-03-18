class Diary {
  final int id;
  final String title;
  final String description;

  Diary({this.id, this.title, this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}

//TODO: add mood and weather