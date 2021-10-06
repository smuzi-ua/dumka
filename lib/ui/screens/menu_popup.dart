import 'package:dumka/ui/screens/account_screen.dart';
import 'package:dumka/ui/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPopup extends StatelessWidget {
  final BuildContext screenContext;

  const MenuPopup(this.screenContext);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        CircleAvatar(
          radius: 34,
          backgroundColor: Colors.grey.shade100,
          child: Icon(Icons.face, size: 28, color: Colors.deepPurple.shade600),
        ),
        const SizedBox(
          height: 12,
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
        _MenuItemComponent(
            text: 'Обліковий запис',
            icon: Icons.face,
            onPressed: () {
              Navigator.of(screenContext).popUntil((route) => route.isFirst);

              Navigator.of(screenContext).pushReplacement(
                  MaterialPageRoute(builder: (_) => AccountScreen()));
            }),
        const SizedBox(
          height: 16,
        ),
        _MenuItemComponent(
            text: 'Налаштування',
            icon: Icons.settings_rounded,
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            }),
        const SizedBox(
          height: 16,
        ),
        _MenuItemComponent(
            text: 'Про Думку',
            icon: Icons.info_outline,
            onPressed: () {
              Navigator.of(context).pushNamed('/about');
            }),
        const SizedBox(height: 16),
        Text(
          'Dumka v1.0',
          style:
              GoogleFonts.comfortaa(fontSize: 12, color: Colors.grey.shade800),
        ),
        Text(
          '2021',
          style:
              GoogleFonts.comfortaa(fontSize: 10, color: Colors.grey.shade800),
        ),
      ]),
    );
  }
}

class _MenuItemComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;

  const _MenuItemComponent({
    @required this.text,
    @required this.icon,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
          color: Colors.grey.shade100,
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          onPressed: onPressed,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    text,
                    style: GoogleFonts.andika(fontSize: 15),
                  ),
                  Icon(icon, color: Colors.grey.shade700),
                ],
              ))),
    );
  }
}
