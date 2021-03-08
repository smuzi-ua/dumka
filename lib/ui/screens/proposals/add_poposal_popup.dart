import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddProposalPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 500,
      child: SingleChildScrollView(
          child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 40),
              child: Text(
                'Додавання нової пропозиції',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Тема',
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                const TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Текст',
                  ),
                  maxLines: 100,
                  minLines: 5,
                ),
                FlatButton(
                  onPressed: () {},
                  child: const Icon(
                    MdiIcons.paperclip,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 44,
                    minWidth: 179,
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {},
                    color: UIConfig.purple2,
                    textColor: Colors.white,
                    child: const Text(
                      'Додати пропозицію',
                    ),
                  )),
            )
          ],
        ),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
