import 'package:flutter/material.dart';
import 'package:Dumka/utils/const.dart';
class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.deep_purple_300,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(80),
              child: const Text(
                'Dumka ?',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              height:601.11,
              width: double.infinity,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.white),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[

                    Text('Верифікація', style: TextStyle(fontSize: 24),),
                    Image(
                      image: AssetImage('assets/verification_photo.png'),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Код доступу',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Text(' Для того щоб активувати аккаунт.... Для того щоб активувати аккаунт.... Для того щоб активувати аккаунт.... Для того щоб активувати аккаунт....'),
                    Container(
                      width: 143.06 ,
                      child: FlatButton(
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Text(
                          'Продовжити',
                          style: TextStyle(color: Colors.white),
                        ),
                        disabledColor: UIConfig.deep_purple_300,
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
