import 'package:dumka/data/model/models.dart';
import 'package:flutter/foundation.dart';

abstract class AuthState {}

class AuthUninitializedState extends AuthState {}

class AuthWaitingForVerificationState extends AuthState {}

class AuthAuthorizedState extends AuthState {}


