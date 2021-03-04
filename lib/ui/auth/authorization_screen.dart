import 'package:dumka/ui/user/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                    padding: const EdgeInsets.all(25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
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
                              const SizedBox(
                                height: 6,
                              ),
                              const Text('Вашої школи немає в списку?')
                            ],
                          ),
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
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
