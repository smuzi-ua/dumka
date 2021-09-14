import 'package:dumka/data/api/requests.dart';
import 'package:dumka/data/model/models.dart';
import 'package:dumka/utils/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DumkaRepository {
  final _requests = Requests();

  Future<List<School>> fetchSchoolsList() {
    return _requests.fetchSchools();
  }

  Future<bool> auth(int schoolId, String name, String nickname) async {
    print('repo auth');
    final req = await _requests.auth(schoolId, name, nickname);
    print(req.statusCode);
    return req.statusCode == 200;
  }

  Future<void> fetchProposalsList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(Prefs.tokenPref) ?? '';

    final response = _requests.fetchProposalsList(token);
    return response;
  }
}
