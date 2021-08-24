// TODO: Make models for working with network

class School {
  int id;
  String name;

  School({this.id, this.name});

  School.builder();

  School fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  List<School> listFromJson(List<dynamic> listOfJson) =>
      listOfJson.map((item) => fromJson(item as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Proposal {}
