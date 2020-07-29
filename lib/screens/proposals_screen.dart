import 'package:Dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProposalsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: UIConfig.bgColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            title: TabBar(
              unselectedLabelColor: Colors.grey[500],
              labelColor: Colors.grey[800],
              labelStyle: const TextStyle(fontSize: 25.0),
              indicatorColor: UIConfig.primaryColor,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const Tab(text: Texts.proposalsText),
                const Tab(text: Texts.reportsText),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ProposalsWidget(),
              ReportsWidget(),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
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
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            leading: SvgPicture.asset('assets/brain.svg'),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  DemoData.namesOfProposal[index],
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 20,
                      child: FlatButton.icon(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.deepPurple[400]),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.all(1),
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.triangle,
                          color: Colors.deepPurple[400],
                          size: 12,
                        ),
                        label: Text(
                          DemoData.numberOfComments[index].toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    SizedBox(
                      width: 40,
                      height: 20,
                      child: FlatButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color: Colors.deepOrange[500],
                        padding: const EdgeInsets.all(1),
                        onPressed: () {},
                        icon: Transform.rotate(
                          angle: 180 * 3.14 / 180,
                          child: const Icon(
                            MdiIcons.triangle,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                        label: Text(
                          DemoData.numberOfComments[index].toString(),
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 9),
                  ],
                ),
              ],
            ),
            trailing: SizedBox(
              width: 40,
              height: 20,
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.all(1),
                color: Colors.grey[300],
                onPressed: () {
                  // todo Comments
                },
                icon: Icon(
                  MdiIcons.commentMultipleOutline,
                  color: UIConfig.primaryColor,
                  size: 12,
                ),
                label: Text(
                  DemoData.numberOfComments[index].toString(),
                  style: TextStyle(color: UIConfig.primaryColor, fontSize: 10),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReportsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: DemoData.namesOfProposal.length,
      itemBuilder: (BuildContext context, int index) {
        // todo move to model_views & display it using model
        return Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            leading: SvgPicture.asset('assets/brain.svg'),
            title:
            Text(
              DemoData.namesOfProposal[index],
              style: const TextStyle(fontSize: 15),
            ),
            trailing: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle
              ),
              alignment: Alignment.center,
              child: Text(
                DemoData.numberOfComments[index].toString(),
                style: TextStyle(color: UIConfig.primaryColor, fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }
}
