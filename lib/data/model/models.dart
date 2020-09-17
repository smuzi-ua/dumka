
// TODO: Make models for working with network

class School {
  final int id;
  final String title;
  final String place;

  School({this.id, this.title, this.place});

  factory School.fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as int,
      title: json['title'] as String,
      place: json['place'] as String,
    );
  }
}

class Proposal {

}