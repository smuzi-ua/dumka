import 'package:Dumka/screens/proposals_screen.dart';
import 'package:Dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthorizationScreen extends StatefulWidget {
  @override
  AuthorizationState createState() {
    return new AuthorizationState();
  }
}

class AuthorizationState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    String dropDownValue = '1';
    var dropDownMenuItems = [
      const DropdownMenuItem(
        value: '1',
        child: Text('ЛФМЛ'),
      ),
      const DropdownMenuItem(child: Text('УФМЛ'), value: '2'),
      const DropdownMenuItem( value: '3',child: Text('Школа №47')),
      const DropdownMenuItem(child: Text('Школа №56'), value: '4')
    ];
    return Scaffold(
      backgroundColor: UIConfig.purple3,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(75.67),
            child: const Text(
              'Dumka ?',
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.white),
              height: 400,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    // ignore: prefer_const_literals_to_create_immutables
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
                            decoration: InputDecoration(labelText: "Школа"),
                            hint: Text("Школа"),
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            onChanged: (String newValue) {
                              setState(() {
                                dropDownValue = newValue;
                              });
                            },
                            items: dropDownMenuItems,
                          ),
                          Text('Вашої школи немає в списку?')
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
                      Container(
                        width: 143.06,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          child: Text(
                            "Увійти",
                            style: TextStyle(color: Colors.white),
                          ),
                          disabledColor: UIConfig.purple2,
                        ),
                      )
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
