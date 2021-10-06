import 'package:dumka/ui/components/main_bottom_menu.dart';
import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomMenu(context, sideScreen: true),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        backgroundColor: Colors.deepPurple.shade300,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
        child: const Icon(
          MdiIcons.arrowLeft,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24))),
        elevation: 0,
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: Text(
          'Обліковий запис',
          style: GoogleFonts.montserrat(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),

      ),
      backgroundColor: UIConfig.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 22),
            Center(child: SvgPicture.asset('assets/account.svg')),
            const SizedBox(height: 14),
            const Center(
              child: Text("Ім'я Прізвище",
                  style: TextStyle(fontSize: 16, color: Colors.black)),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(Texts.accountStudent,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
            ),
            const SizedBox(height: 8),
            Text(Texts.accountGeneral,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade800)),
            const SizedBox(height: 10),
            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
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
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(Texts.accountNetworks,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800])),
            ),
            const SizedBox(height: 10),
            Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
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
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 14),
                      Icon(
                        MdiIcons.plus,
                        color: Colors.deepPurple[400],
                        size: 25,
                      ),
                      const SizedBox(width: 16),
                      const Text(Texts.accountAdd,
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      const SizedBox(width: 14),
                    ],
                  )),
            ),
            const SizedBox(height: 24),
            Material(
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                onTap: () async {
                  print('logging out');
                  final s = await SharedPreferences.getInstance();
                  s.remove(Prefs.tokenPref);
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 14),
                        Icon(
                          MdiIcons.logout,
                          color: Colors.deepPurple[400],
                          size: 25,
                        ),
                        const SizedBox(width: 16),
                        const Text('Вийти',
                            style: TextStyle(fontSize: 16, color: Colors.black)),
                        const SizedBox(width: 14),
                      ],
                    )),
              ),
            ),
            const Spacer(flex: 10),
          ],
        ),
      ),
    );
  }
}
