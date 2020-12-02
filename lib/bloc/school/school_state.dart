import 'package:dumka/data/model/models.dart';
import 'package:flutter/foundation.dart';

abstract class SchoolListState {}
class SchoolListUninitializedState extends SchoolListState {}
class SchoolListFetchingState extends SchoolListState {}

class SchoolListFetchedState extends SchoolListState {
  final List<School> schools;
  SchoolListFetchedState({@required this.schools});
}
class SchoolListErrorState extends SchoolListState {}
class SchoolListEmptyState extends SchoolListState {}