
import 'dart:convert';

import 'package:Dumka/data/api/api.dart';
import 'package:Dumka/data/model/models.dart';
import 'package:dio/dio.dart';

// Dio Docs: https://github.com/flutterchina/dio/blob/master/README.md

// Open Endpoints
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
    final response = await Api.instance.dio.post(postSchools);
    final _schoolList = <School>[];

    if (response.statusCode == 200) {
      response.data.forEach((data) {
        _schoolList.add(School.fromJson(data as Map<String, dynamic>));
      });
    }

    return _schoolList;
  }

  Future<Response> fetchStatus() async {
    final response = await Api.instance.dio.post(postStatus);
    return response;
  }

  Future<Response> fetchReportCategories() async {
    final response = await Api.instance.dio.post(postReportCategories);
    return response;
  }

  Future<Response> auth() async {
    final response = await Api.instance.dio.post(postAuth);
    return response;
  }

  // TODO: Add Token
  Future<Response> fetchUserInfo() async {
    final response = await Api.instance.dio.post(postUser);
    return response;
  }

  Future<Response> fetchSchoolInfo() async {
    final response = await Api.instance.dio.post(postSchoolInfo);
    return response;
  }

  Future<Response> fetchProposalsList() async {
    final response = await Api.instance.dio.post(postProposals);
    return response;
  }

  Future<Response> addProposal() async {
    final response = await Api.instance.dio.post(postAddProposal);
    return response;
  }
}