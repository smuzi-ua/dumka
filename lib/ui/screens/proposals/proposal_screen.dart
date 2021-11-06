import 'package:dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../components/proposal_body.dart';

class ProposalScreen extends StatelessWidget {
  final int index;

  const ProposalScreen(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      appBar: AppBar(
          toolbarHeight: 68,
          elevation: 0,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: Align(
            child: Text(Texts.proposalsText,
                style: TextStyle(fontSize: 28.0, color: Colors.grey[800])),
          )),
      body: Column(
        children: [
      Container(
        height: 47,
        margin: const EdgeInsets.fromLTRB(15, 16, 15, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Автор",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            Text(
              "@Nickname",
              style: TextStyle(color: Colors.deepPurple[300], fontSize: 14),
            ),
          ],
      )
      ),
      ),
          ProposalBodyComponent(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 75,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        const Spacer(),
                        Icon(
                          MdiIcons.triangle,
                          color: Colors.deepPurple[300],
                        ),
                        const Spacer(),
                        const Text(
                          "100",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 75,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        const Spacer(),
                    Transform.rotate(
                      angle: 180 * math.pi / 180,
                        child: Icon(
                          MdiIcons.triangle,
                          color: Colors.deepPurple[300],
                        ),
                    ),
                        const Spacer(),
                        const Text(
                          "10",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                SizedBox(
                  width: 134,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        const Spacer(),
                        Icon(
                          MdiIcons.plus,
                          color: Colors.deepPurple[300],
                        ),
                        const Spacer(),
                        const Text(
                          "Коментувати",
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            // todo list of comments
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: UIConfig.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Text('something is wrong')),
          );
        },
        child: const Icon(
          MdiIcons.arrowLeft,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: SizedBox(
          height: 54,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(MdiIcons.menu),
                color: Colors.grey,
                onPressed: () {
                  // showSettingsWindow(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

// void showSettingsWindow(BuildContext context) {
//   DumkaBottomSheet.show(context, ProposalsSettingsWidget());
// }
}