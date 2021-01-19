import 'package:dumka/screens/proposal/proposal_settings_widget.dart';
import 'package:dumka/utils/const.dart';
import 'package:dumka/utils/dumka_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'proposal_body_widget.dart';

class ApproveProposalScreen extends StatelessWidget {
  final int index;

  const ApproveProposalScreen(this.index);

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
      body: ProposalInfoWidget(),
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
                  showSettingsWindow(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSettingsWindow(BuildContext context) {
    DumkaModalSheet.show(
        context: context,
        child: ProposalsSettingsWidget()
    );
  }
}
