import 'package:dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../components/proposal_body.dart';

class ProposalModerationScreen extends StatelessWidget {
  final int index;

  const ProposalModerationScreen(this.index);

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
          ProposalBodyComponent(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(
                  width: 98,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Spacer(),
                        const Spacer(),
                        const Text(
                          Texts.approveConfirmButton,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 98,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Spacer(),
                        const Spacer(),
                        const Text(
                          Texts.approveDeclineButton,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 98,
                  height: 42,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: const EdgeInsets.all(1),
                    color: Colors.white,
                    onPressed: () {},
                    child: const Text(
                      Texts.approveDeclineAndReportButton,
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          )
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
