import 'package:Dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
          const Text('Імя Прізвище',
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
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 4,
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
