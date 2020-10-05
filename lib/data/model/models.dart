
// TODO: Make models for working with network

import 'package:Dumka/data/model/generic_type.dart';

class School extends GenericType {
  int id;
  String name;
  bool display;

  School({this.id, this.name, this.display});

  School.builder();

  @override
  School fromJson(Map<String, dynamic> json) {
    return School(
      id: json['id'] as int,
      name: json['name'] as String,
      display: json['display'] as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'name': name,
        'display': display
      };
}

class Proposal {

}