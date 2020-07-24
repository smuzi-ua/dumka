import 'package:Dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProposalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                // todo Proposals
              },
              child: Text(
                PROPOSALS_TEXT,
                style: TextStyle(fontSize: 25.0, color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                // todo Reports
              },
              child: Text(
                REPORTS_TEXT,
                style: TextStyle(fontSize: 25.0, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: ProposalsWidget()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: fabColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          // todo Add Button
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.grey,
              onPressed: () {
                // todo Menu
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              color: Colors.grey,
              onPressed: () {
                // todo Search
              },
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}

class ProposalsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: namesOfProposal.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ListTile(
              leading: SvgPicture.asset("assets/brain.svg"),
              title: Text(
                "${namesOfProposal[index]}",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Container(
                width: 40.0,
                height: 20.0,
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text("${numberOfComments[index]}",
                    style: TextStyle(fontSize: 10)),
              ),
            ),
          );
        },
      ),
    );
  }
}
