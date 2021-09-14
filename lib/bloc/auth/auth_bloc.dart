import 'package:dumka/bloc/auth/auth_state.dart';
import 'package:dumka/bloc/school/school_event.dart';
import 'package:dumka/bloc/school/school_state.dart';
import 'package:dumka/data/model/models.dart';
import 'package:dumka/data/repository/dumka_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';

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

      final res = await repository.auth(event.schoolId, event.name, event.login);

      if (res) {
        yield AuthWaitingForVerificationState();
      } else {
        yield AuthUninitializedState();
      }
    }
  }
}
