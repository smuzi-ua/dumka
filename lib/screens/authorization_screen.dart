import 'package:dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../wrapper.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  AuthorizationState createState() {
    return AuthorizationState();
  }
}

class AuthorizationState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    var dropDownValue = '1';
    final dropDownMenuItems = [
      const DropdownMenuItem(
        value: '1',
        child: Text('ЛФМЛ'),
      ),
      const DropdownMenuItem(
        value: '2',
        child: Text('УФМЛ'),
      ),
      const DropdownMenuItem(value: '3', child: Text('Школа №47')),
      const DropdownMenuItem(
        value: '4',
        child: Text('Школа №56'),
      )
    ];
    return Scaffold(
      backgroundColor: UIConfig.purple3,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Dumka ?',
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                      color: Colors.white),
                  height: 440,
                  padding: const EdgeInsets.all(25),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          'Авторизація',
                          style: TextStyle(fontSize: 24),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            DropdownButtonFormField<String>(
                              value: dropDownValue,
                              decoration:
                                  const InputDecoration(labelText: 'Школа'),
                              hint: const Text('Школа'),
                              icon: const Icon(MdiIcons.arrowDown),
                              elevation: 16,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownValue = newValue;
                                });
                              },
                              items: dropDownMenuItems,
                            ),
                            const Text('Вашої школи немає в списку?')
                          ],
                        ),
                        const TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Нікнейм',
                          ),
                        ),
                        const TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Призвіще Імя',
                          ),
                        ),
                        SizedBox(
                          width: 143.06,
                          child: FlatButton(
                            color: Colors.purple[300],
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DumkaAppWrapper(),
                                  ));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0)),
                            disabledColor: UIConfig.purple2,
                            child: const Text(
                              'Увійти',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
