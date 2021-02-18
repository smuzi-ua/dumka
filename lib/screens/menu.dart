import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'menu/about_screen.dart';
import 'menu/account_screen.dart';
import 'menu/settings_screen.dart';

class BottomMenuFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Container(
            width: 68,
            height: 68,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                //fit: BoxFit.fill
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 2.62),
          child: Text(
            "Ім'я Прізвище",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
              color: const Color(0xFFF5F5F5),
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AccountWidget()));
              },
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Обліковий запис',
                        style: GoogleFonts.andika(fontSize: 15),
                      ),
                      const Icon(Icons.account_box),
                    ],
                  ))),
        ),
        const SizedBox(
          height: 16,
        ),
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
              color: const Color(0xFFF5F5F5),
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => SettingsWidget()));
              },
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Налаштування',
                        style: GoogleFonts.andika(fontSize: 15),
                      ),
                      const Icon(Icons.settings_rounded),
                    ],
                  ))),
        ),
        const SizedBox(
          height: 16,
        ),
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
              color: const Color(0xFFF5F5F5),
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AboutWidget()));
              },
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Про Думку',
                        style: GoogleFonts.andika(fontSize: 15),
                      ),
                      const Icon(MdiIcons.message),
                    ],
                  ))),
        ),
        const SizedBox(height: 16),
        Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: MaterialButton(
              color: const Color(0xFFF5F5F5),
              elevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              onPressed: () {
                // todo
              },
              child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Вийти',
                    style: GoogleFonts.andika(fontSize: 15),
                  ))),
        ),
        const SizedBox(height: 16),
        Text(
          'Dumka for Android, v1.0',
          style: GoogleFonts.comfortaa(fontSize: 11),
        ),
        Text(
          '2021',
          style: GoogleFonts.comfortaa(fontSize: 10),
        ),
      ]),
    );
  }
}
