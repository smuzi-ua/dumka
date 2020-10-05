import 'package:Dumka/data/model/models.dart';
import 'package:flutter/foundation.dart';

abstract class SchoolListEvent {}

class SchoolListFetchEvent extends SchoolListEvent{
  SchoolListFetchEvent();
}