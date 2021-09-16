import 'package:dumka/bloc/auth/auth_bloc.dart';
import 'package:dumka/bloc/auth/auth_event.dart';
import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  final codeController = TextEditingController();
  final int schoolId;
  final String nickname;

  VerificationScreen(this.schoolId, this.nickname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.deepPurple300,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(80),
              child: Text(
                'Dumka ?',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              height: 601.11,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text(
                      'Верифікація',
                      style: TextStyle(fontSize: 24),
                    ),
                    SvgPicture.asset('assets/account_verification.svg'),
                    TextField(
                      controller: codeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Код доступу',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const Text(
                        ' Для того щоб активувати аккаунт.... Для того щоб активувати аккаунт.... Для того щоб активувати аккаунт.... Для того щоб активувати аккаунт....'),
                    SizedBox(
                      width: 143.06,
                      child: FlatButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthVerifyEvent(schoolId, nickname, codeController.text));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        disabledColor: UIConfig.deepPurple300,
                        child: const Text(
                          'Продовжити',
                          // style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
