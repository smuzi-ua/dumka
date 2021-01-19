import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
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
