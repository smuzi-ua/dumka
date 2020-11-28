import 'package:flutter/material.dart';
import 'package:dumka/utils/const.dart';

class VerificationScreen extends StatelessWidget {
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
                    const Image(
                      image: AssetImage('assets/verification_photo.png'),
                    ),
                    const TextField(
                      decoration: InputDecoration(
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
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        disabledColor: UIConfig.deepPurple300,
                        child: const Text(
                          'Продовжити',
                          style: TextStyle(color: Colors.white),
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
