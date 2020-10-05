import 'dart:convert';

import 'package:Dumka/data/api/requests.dart';
import 'package:Dumka/data/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Dumka/utils/const.dart';


class DumkaRepository {
  final _requests = Requests();

  Future<List<School>> fetchSchoolsList() {
    return _requests.fetchSchools();
  }

  Future<void> fetchProposalsList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Prefs.token_pref) ?? '';

    final response = _requests.fetchProposalsList(token);
    return response;
  }
}