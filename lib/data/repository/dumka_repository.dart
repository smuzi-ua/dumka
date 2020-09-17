import 'dart:convert';

import 'package:Dumka/data/api/requests.dart';
import 'package:Dumka/data/model/models.dart';

class DumkaRepository {
  final _requests = Requests();

  List<School> fetchSchoolsList() {
    final response = _requests.fetchSchools();
    // TODO parse into list of School models
    return List<School>.empty(growable: true);
  }

  void fetchProposalsList() {
    final response = _requests.fetchProposalsList();
  }
}