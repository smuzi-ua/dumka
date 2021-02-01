import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  const Text(Texts.settingsTheme,
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
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  const Text(Texts.settingsLanguage,
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
