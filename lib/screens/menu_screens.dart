import 'package:Dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MenuScreens extends StatelessWidget {
  final Widget body;
  final String title;

  const MenuScreens(this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: UIConfig.bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18.0),
            ),
          ),
          title: Center(
              child: Text(
            title,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800])),
          )),
        ),
        body: body,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: UIConfig.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            MdiIcons.keyboardBackspace,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          child: SizedBox(
            height: 54,
            child: IconButton(
              alignment: Alignment.centerLeft,
              icon: const Icon(MdiIcons.menu),
              color: Colors.grey,
              onPressed: () {
                // todo Menu
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AccountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      body: Column(
        children: <Widget>[
          const Spacer(flex: 4),
          Center(child: SvgPicture.asset('assets/account.svg')),
          const Spacer(flex: 2),
          // ignore: avoid_escaping_inner_quotes
          const Text('Ім\'я Прізвище',
              style: TextStyle(fontSize: 16, color: Colors.black)),
          const Spacer(),
          Text('учень',
              style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          const Spacer(flex: 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Загальні',
                style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          ),
          const Spacer(),
          Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text('Нікнейм',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  const Spacer(flex: 20),
                  Text('Nickname',
                      style: TextStyle(
                          fontSize: 14, color: Colors.deepPurple[200])),
                  const Spacer(),
                  Icon(
                    MdiIcons.pencil,
                    color: Colors.deepPurple[400],
                    size: 18,
                  ),
                ],
              )),
          const Spacer(flex: 3),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Соціальні мережі',
                style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          ),
          const Spacer(),
          Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text('Інстаграм',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  const Spacer(flex: 20),
                  Text('@Nickname',
                      style: TextStyle(
                          fontSize: 14, color: Colors.deepPurple[200])),
                  const Spacer(),
                  Icon(
                    MdiIcons.trashCanOutline,
                    color: Colors.deepPurple[400],
                    size: 18,
                  ),
                ],
              )),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
                height: 47,
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Icon(
                      MdiIcons.plus,
                      color: Colors.deepPurple[400],
                      size: 25,
                    ),
                    const Spacer(),
                    const Text('Додати',
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ],
                )),
          ),
          const Spacer(flex: 10),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingsWidget extends StatelessWidget {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      body: Column(
        children: <Widget>[
          const Spacer(flex: 2),
          Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Icon(
                    MdiIcons.moonWaningCrescent,
                    color: Colors.deepPurple[400],
                    size: 25,
                  ),
                  const Text('Темна тема',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  const Spacer(flex: 11),
                  GestureDetector(
                    onTap: () {
                      isChecked = !isChecked;
                    },
                    child: SizedBox(
                      height: 18,
                      width: 32,
                      child: CustomSwitchButton(
                        backgroundColor: Colors.deepPurple[400],
                        unCheckedColor: Colors.white,
                        animationDuration: const Duration(milliseconds: 400),
                        checkedColor: Colors.lightGreen,
                        checked: isChecked,
                      ),
                    ),
                  ),
                ],
              )),
          const Spacer(),
          Container(
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Icon(
                    MdiIcons.translate,
                    color: Colors.deepPurple[400],
                    size: 23,
                  ),
                  const Spacer(),
                  const Text('Мова',
                      style: TextStyle(fontSize: 16, color: Colors.black)),
                  const Spacer(flex: 13),
                  DropdownButton<String>(
                    items: <String>['Українська', 'Русский', 'English']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: const Text('Українська'),
                    icon: const Icon(MdiIcons.menuDown),
                    onChanged: (_) {},
                  )
                ],
              )),
          const Spacer(flex: 26),
        ],
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      body: Column(
        children: <Widget>[
          const Spacer(flex: 2),
          Container(
              height: 142,
              width: 343,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text('*тут багато букв про нас*',
                  style: TextStyle(fontSize: 16, color: Colors.black)),),
          // ignore: avoid_escaping_inner_quotes
          const Spacer(flex: 2),
          // ignore: avoid_escaping_inner_quotes
          Text('Зворотній зв\'язок',
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 42,
                height: 42,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(1),
                  color: Colors.white,
                  onPressed: () {
                    // todo Comments
                  },
                  child: const Icon(
                    MdiIcons.emailOutline,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 42,
                height: 42,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(1),
                  color: Colors.white,
                  onPressed: () {
                    // todo Comments
                  },
                  child: const Icon(
                    MdiIcons.instagram,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 42,
                height: 42,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(1),
                  color: Colors.white,
                  onPressed: () {
                    // todo Comments
                  },
                  child: const Icon(
                    MdiIcons.telegram,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 42,
                height: 42,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(1),
                  color: Colors.white,
                  onPressed: () {
                    // todo Comments
                  },
                  child: const Icon(
                    MdiIcons.facebook,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 2),
          Text('Підтримати нас',
              style: TextStyle(fontSize: 14, color: Colors.grey[800])),
          const Spacer(),
          SizedBox(
            width: 42,
            height: 42,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(1),
              color: Colors.white,
              onPressed: () {
                // todo Comments
              },
              child: const Icon(
                MdiIcons.patreon,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(flex: 6),
        ],
      ),
    );
  }
}
