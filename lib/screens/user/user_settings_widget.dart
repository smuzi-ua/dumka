

import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 59.0, 0, 8),
        child: Container(
          width: 68,
          height: 68,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                  'https://googleflutter.com/sample_image.jpg'),
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
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: BoxDecoration(
              color: UIConfig.grey,
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          child: InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text('Обліковий запис'),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(MdiIcons.accountCircle),
                      onPressed: () {
                        //do nothing
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Налаштування'),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(MdiIcons.cog),
                    onPressed: () {
                      //do nothing
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(9.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Row(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Text('Про Думку'),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(MdiIcons.message),
                    onPressed: () {
                      //do nothing
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 3.84, 0, 21.84),
        child: FlatButton(
          onPressed: () {},
          color: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: const Text('Вийти'),
        ),
      ),
      const Text(
        'Dumka for Android, v 1.0',
        style: TextStyle(fontSize: 11),
      ),
      const Text(
        '2020',
        style: TextStyle(fontSize: 10),
      ),
    ]);
  }

}