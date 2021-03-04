import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
      ),
      backgroundColor: UIConfig.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: <Widget>[
            const Spacer(flex: 4),
            Center(child: SvgPicture.asset('assets/account.svg')),
            const Spacer(flex: 2),
            // ignore: avoid_escaping_inner_quotes
            const Text('Ім\'я Прізвище',
                style: TextStyle(fontSize: 16, color: Colors.black)),
            const Spacer(),
            Text(Texts.accountStudent,
                style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            const Spacer(flex: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(Texts.accountGeneral,
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
                    const Text(Texts.accountNickname,
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
              child: Text(Texts.accountNetworks,
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
                  width: MediaQuery.of(context).size.width / 3.5,
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
                      const Text(Texts.accountAdd,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  )),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
