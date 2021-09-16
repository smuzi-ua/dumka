abstract class AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final int schoolId;
  final String name;
  final String login;

  AuthLogInEvent(this.schoolId, this.name, this.login);
}
class AuthVerifyEvent extends AuthEvent {
  final int schoolId;
  final String login;
  final String code;

  AuthVerifyEvent(this.schoolId, this.login, this.code);
}