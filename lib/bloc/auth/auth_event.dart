abstract class AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final int schoolId;
  final String name;
  final String login;

  AuthLogInEvent(this.schoolId, this.name, this.login);
}
