import 'package:dumka/bloc/school/school_bloc.dart';
import 'package:dumka/bloc/school/school_event.dart';
import 'package:dumka/bloc/school/school_state.dart';
import 'package:dumka/data/model/models.dart';
import 'package:dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../main_screen.dart';

class AuthorizationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SafeArea(
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 22,
                        ),
                        Spacer(),
                        Text(
                          'Dumka ?',
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Text(
                          'Ділися своїми думками і пропозиціями з усіма учасниками навчального процесу',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24)),
                          color: Colors.white),
                      padding: const EdgeInsets.all(24),
                      width: double.infinity,
                      child: _AuthCard()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// todo separate screen for choosing school - with sorted scroll and search bar
// FIXME: is built twice for some reason
class _AuthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolListState>(
        bloc: SchoolBloc()..add(SchoolListFetchEvent()),
        builder: (_, SchoolListState state) {
          if (state is SchoolListUninitializedState ||
              state is SchoolListFetchingState) {
            return Column(
              children: [
                SizedBox(
                  width: 26,
                  height: 26,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(UIConfig.primaryColor),
                  ),
                ),
              ],
            );
          }

          assert(state is SchoolListFetchedState);

          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Авторизація',
                  style: TextStyle(fontSize: 24, color: Colors.grey.shade900),
                ),
                const SizedBox(
                  height: 16,
                ),
                DropdownButtonFormField<School>(
                  decoration: const InputDecoration(labelText: 'Школа'),
                  icon: const Icon(MdiIcons.arrowDown),
                  elevation: 16,
                  onChanged: (School newValue) {},
                  items: (state as SchoolListFetchedState)
                      .schools
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text('Вашої школи немає в списку?')),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Нікнейм',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Призвіще Імя',
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  width: 143.06,
                  child: FlatButton(
                    color: Colors.deepPurple.shade400,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainUserScreen(),
                          ));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    // disabledColor: Colors.deepPurple.shade900,
                    child: const Text(
                      'Увійти',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ]);
        });
  }
}
