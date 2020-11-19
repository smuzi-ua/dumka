import 'package:Dumka/screens/menu_screens.dart';
import 'package:Dumka/ui/components.dart';
import 'package:Dumka/utils/const.dart';
import 'package:Dumka/utils/dumka_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:Dumka/ui/components.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class ProposalsScreen extends StatelessWidget {
  void showAddSuggestionWindow(BuildContext c) {
    DumkaModalSheet.show(
        context: c,
        child: Container(
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
        ));
  }

  void showSettingsWindow(BuildContext context) {
    DumkaModalSheet.show(
        context: context,
        child: Column(children: <Widget>[
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
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // https://stackoverflow.com/questions/52592588/bottomappbar-floating-action-button-notch-inset-is-not-transparent
        extendBody: true,
        backgroundColor: UIConfig.bgColor,
        appBar: AppBar(
          toolbarHeight: 86,
          elevation: 0,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18),
            ),
          ),
          // todo proper tabs & navigation
          title: Theme(
            data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    // height: 68,
                    child: TabBar(
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Colors.grey[800],
                      labelStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                      indicatorColor: Colors.transparent,
                      tabs: const [
                        Tab(text: Texts.proposalsText),
                        Tab(text: Texts.reportsText),
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    height: 28,
                    child: TabBar(
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                      unselectedLabelColor: Colors.grey[500],
                      labelColor: Colors.deepPurple.shade700,
                      indicatorSize: TabBarIndicatorSize.label,
                      //makes it better

                      labelStyle: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      indicator: MD2Indicator(
                          //it begins here
                          indicatorHeight: 2.4,
                          indicatorColor: Colors.deepPurple.shade700,
                          indicatorSize: MD2IndicatorSize.normal),
                      tabs: const [
                        Tab(text: Texts.proposalsText),
                        Tab(text: Texts.reportsText),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ProposalsWidget(),
            ReportsWidget(),
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          backgroundColor: UIConfig.primaryColor,
          onPressed: () {
            showAddSuggestionWindow(context);
          },
          child: const Icon(
            MdiIcons.plus,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
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
    );
  }
}

class ProposalsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60, left: 16, right: 16, top: 8),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Row(
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
                                const Spacer(),
                                Icon(
                                  MdiIcons.triangle,
                                  color: Colors.deepPurple[400],
                                  size: 11,
                                ),
                                const Spacer(),
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
                        const Spacer(),
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
                                const Spacer(),
                                Transform.rotate(
                                  angle: 180 * 3.14 / 180,
                                  child: const Icon(
                                    MdiIcons.triangle,
                                    color: Colors.white,
                                    size: 11,
                                  ),
                                ),
                                const Spacer(),
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
                        const Spacer(
                          flex: 13,
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
                                const Spacer(),
                                Icon(
                                  MdiIcons.commentMultipleOutline,
                                  color: UIConfig.primaryColor,
                                  size: 12,
                                ),
                                const Spacer(),
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
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
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
            const Spacer(),
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
            const Spacer(),
          ]),
        );
      },
    );
  }
}
