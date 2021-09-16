import 'package:dumka/bloc/auth/auth_bloc.dart';
import 'package:dumka/bloc/auth/auth_event.dart';
import 'package:dumka/bloc/auth/auth_state.dart';
import 'package:dumka/ui/screens/auth/verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../bloc/school/school_bloc.dart';
import '../../../bloc/school/school_event.dart';
import '../../../bloc/school/school_state.dart';
import '../../../data/model/models.dart';
import '../../../utils/const.dart';
import '../main_screen.dart';

class AuthorizationScreen extends StatelessWidget {
  final _authCard = _AuthCard();

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
                      width: double.maxFinite,
                      child: _authCard),
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
class _AuthCard extends StatefulWidget {
  @override
  __AuthCardState createState() => __AuthCardState();
}

class __AuthCardState extends State<_AuthCard> {
  final _bloc = SchoolBloc();
  int schoolId;

  final nameController = TextEditingController();
  final loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_bloc.state is SchoolListUninitializedState) {
      print('fetching');
      _bloc.add(SchoolListFetchEvent());
    }

    return BlocBuilder<SchoolBloc, SchoolListState>(
        bloc: _bloc,
        builder: (_, SchoolListState stateSchools) {
          if (stateSchools is SchoolListUninitializedState ||
              stateSchools is SchoolListFetchingState) {
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

          assert(stateSchools is SchoolListFetchedState);

          return BlocBuilder<AuthBloc, AuthState>(
              bloc: context.read<AuthBloc>(),
              builder: (context, stateAuth) {
                if (stateAuth is AuthWaitingForVerificationState) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => VerificationScreen(schoolId, loginController.text)));
                }

                print('Building auth state: ${stateAuth.runtimeType}');
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Авторизація',
                        style: TextStyle(
                            fontSize: 24, color: Colors.grey.shade900),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      DropdownButtonFormField<School>(
                        isExpanded: true,
                        decoration: const InputDecoration(labelText: 'Школа'),
                        icon: const Icon(MdiIcons.arrowDown),
                        elevation: 16,
                        onChanged: (School newValue) => setState(() => schoolId = newValue.id),
                        items: (stateSchools as SchoolListFetchedState)
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
                      TextField(
                        controller: loginController,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Нікнейм',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: nameController,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
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
                            context.read<AuthBloc>().add(AuthLogInEvent(
                                schoolId,
                                nameController.text,
                                loginController.text));
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
        });
  }
}
