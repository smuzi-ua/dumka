import 'package:Dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                bottom: Radius.circular(18.0),
              ),
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                unselectedLabelColor: Colors.grey[500],
                labelColor: Colors.grey[800],
                labelStyle: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.bold)),
                indicatorColor: Colors.transparent,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  const Tab(text: Texts.proposalsText),
                  const Tab(text: Texts.reportsText),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ProposalsWidget(),
              ReportsWidget(),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
      padding: const EdgeInsets.all(14),
      itemCount: DemoData.namesOfProposal.length,
      itemBuilder: (BuildContext context, int index) {
        // todo move to model_views & display it using model
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.6, color: Colors.grey[300]),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(child: SvgPicture.asset('assets/brain.svg')),
              ),
              const SizedBox(
                width: 18.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DemoData.namesOfProposal[index],
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 14)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 44,
                        height: 22,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.deepPurple[400]),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          padding: const EdgeInsets.all(1),
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              const Spacer(
                                flex: 1,
                              ),
                              Icon(
                                MdiIcons.triangle,
                                color: Colors.deepPurple[400],
                                size: 11,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                DemoData.numberOfComments[index].toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 12)),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      SizedBox(
                        width: 44,
                        height: 22,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.deepOrange[500],
                          padding: const EdgeInsets.all(1),
                          onPressed: () {},
                          child: Row(
                            children: <Widget>[
                              const Spacer(
                                flex: 1,
                              ),
                              Transform.rotate(
                                angle: 180 * 3.14 / 180,
                                child: const Icon(
                                  MdiIcons.triangle,
                                  color: Colors.white,
                                  size: 11,
                                ),
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                DemoData.numberOfComments[index].toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12, color: Colors.white)),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 100.0,
                      ),
                      SizedBox(
                        width: 44,
                        height: 22,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.all(1),
                          color: Colors.grey[300],
                          onPressed: () {
                            // todo Comments
                          },
                          child: Row(
                            children: <Widget>[
                              const Spacer(
                                flex: 1,
                              ),
                              Icon(
                                MdiIcons.commentMultipleOutline,
                                color: UIConfig.primaryColor,
                                size: 12,
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                DemoData.numberOfComments[index].toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        color: UIConfig.primaryColor)),
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
                ],
              ),
            ],
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
      padding: const EdgeInsets.all(14),
      itemCount: DemoData.namesOfProposal.length,
      itemBuilder: (BuildContext context, int index) {
        // todo move to model_views & display it using model
        return Container(
          height: 60,
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(child: SvgPicture.asset('assets/brain.svg')),
            ),
            const SizedBox(
              width: 18.0,
            ),
            Text(
              DemoData.namesOfProposal[index],
              style:
                  GoogleFonts.roboto(textStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(
              width: 18.0,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.grey[300], shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Text(
                DemoData.numberOfComments[index].toString(),
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 12, color: UIConfig.primaryColor)),
              ),
            ),
          ]),
        );
      },
    );
  }
}
