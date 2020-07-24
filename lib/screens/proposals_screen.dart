import 'package:Dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProposalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIConfig.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        // todo proper tabs & navigation
        title: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                // todo open proposal screen
              },
              child: const Text(
                Texts.proposalsText,
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                // todo Reports
              },
              child: const Text(
                Texts.reportsText,
                style: TextStyle(fontSize: 25.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: ProposalsWidget()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: UIConfig.primaryColor,
        onPressed: () {
          // todo Add Button
        },
        child: const Icon(
          MdiIcons.plus,
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
                  // todo Menu
                },
              ),
              IconButton(
                icon: const Icon(MdiIcons.magnify),
                color: Colors.grey,
                onPressed: () {
                  // todo Search
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProposalsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: DemoData.namesOfProposal.length,
      itemBuilder: (BuildContext context, int index) {
        // todo move to model_views & display it using model
        return Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            leading: SvgPicture.asset('assets/brain.svg'),
            title: Text(
              DemoData.namesOfProposal[index],
              style: const TextStyle(fontSize: 15),
            ),
            trailing: Container(
              width: 40.0,
              height: 20.0,
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0)),
              child: Text(DemoData.numberOfComments[index].toString(),
                  style: const TextStyle(fontSize: 10)),
            ),
          ),
        );
      },
    );
  }
}
