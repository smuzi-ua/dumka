import 'package:dio/dio.dart';
import 'package:dumka/data/api/api.dart';
import 'package:dumka/data/model/models.dart';

// Dio Docs: https://github.com/flutterchina/dio/blob/master/README.md

// Open Endpoints
const api = 'https://dumka-backend.herokuapp.com/api/v1';

const postSchools = '/v1/schools';
const postStatus = '/v1/status';
const postReportCategories = '/v1/report_categories';
const postAuth = '/v1/auth';

// Token Endpoints
const postUser = '/v1/u/user';
const postSchoolInfo = '/v1/u/school';
const postProposals = '/v1/u/proposals';
const postAddProposal = '/v1/u/proposals_add';

class Requests {
  Future<List<School>> fetchSchools() async {
    final response = await Api.instance.dio.get('$api/schools');
    print('dio fetch done');
    var schoolList = <School>[];

    if (response.statusCode == 200) {
      schoolList = School.builder().listFromJson(response.data['data'] as List);
    }

    return schoolList;
  }

  Future<Response> fetchStatus() async {
    final response = await Api.instance.dio.get(postStatus);
    return response;
  }

  Future<Response> fetchReportCategories() async {
    final response = await Api.instance.dio.get(postReportCategories);
    return response;
  }

  Future<Response> auth() async {
    final response = await Api.instance.dio.post(postAuth);
    return response;
  }

  Future<Response> fetchUserInfo(String token) async {
    final response = await Api.instance.dio
        .get(postUser, options: Options(headers: {'Authorization': token}));
    return response;
  }

  Future<Response> fetchSchoolInfo(String token) async {
    final response = await Api.instance.dio.get(postSchoolInfo,
        options: Options(headers: {'Authorization': token}));
    return response;
  }

  Future<Response> fetchProposalsList(String token) async {
    final response = await Api.instance.dio.get(postProposals,
        options: Options(headers: {'Authorization': token}));
    return response;
  }

  Future<Response> addProposal(String token) async {
    final response = await Api.instance.dio.post(postAddProposal,
        options: Options(headers: {'Authorization': token}));
    return response;
  }
}
