import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/dumka_repository.dart';
import '../../utils/const.dart';
import 'auth_event.dart';
import 'auth_state.dart';

// https://medium.com/flutter-community/implementing-bloc-pattern-using-flutter-bloc-62a62e0319b5
// https://bloclibrary.dev/#/
// https://www.netguru.com/codestories/flutter-bloc

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthUninitializedState());

  final repository = DumkaRepository();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    print('event: ${event.runtimeType}');

    if (event is AuthLogInEvent) {
      final res =
      await repository.auth(event.schoolId, event.name, event.login);

      if (res) {
        yield AuthWaitingForVerificationState();
      } else {
        yield AuthUninitializedState();
      }
    } else if (event is AuthVerifyEvent) {
      final res =
      await repository.verifyAuth(event.schoolId, event.login, event.code);

      if (res == null) {
        yield AuthWaitingForVerificationState();
      } else {
        final s = await SharedPreferences.getInstance();
        s.setString(Prefs.tokenPref, res);
        // todo save in local storage & show main page
        yield AuthAuthorizedState();
      }
    }
  }
}
