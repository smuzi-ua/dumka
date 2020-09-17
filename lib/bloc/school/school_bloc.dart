import 'package:Dumka/bloc/school/school_event.dart';
import 'package:Dumka/bloc/school/school_state.dart';
import 'package:Dumka/data/model/models.dart';
import 'package:Dumka/data/repository/dumka_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// https://medium.com/flutter-community/implementing-bloc-pattern-using-flutter-bloc-62a62e0319b5
// https://bloclibrary.dev/#/

class SchoolBloc extends Bloc<SchoolListEvent, SchoolListState> {
  SchoolBloc() : super(SchoolListUninitializedState());

  final repository = DumkaRepository();

  @override
  Stream<SchoolListState> mapEventToState(SchoolListEvent event) async* {
    yield SchoolListFetchingState();
    List<School> schools;

    try {
      if (event is SchoolListFetchEvent) {
        schools = await repository.fetchSchoolsList();
      }

      if (schools.isEmpty) {
        yield SchoolListEmptyState();
      } else {
        yield SchoolListFetchedState(schools: schools);
      }
    } catch (_) {
      yield SchoolListErrorState();
    }
  }

}