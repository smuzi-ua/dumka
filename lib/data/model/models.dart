
// TODO: Make models for working with network


class School {
  int id;
  String name;
  bool display;

  School({this.id, this.name, this.display});

  School.builder();

  School fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as int,
      name: json['name'] as String,
      display: json['display'] as bool,
    );
  }

  List<School> listFromJson(List<dynamic> listOfJson) =>
      listOfJson.map((item) => fromJson(item as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'display': display
      };
}

class Proposal {

}