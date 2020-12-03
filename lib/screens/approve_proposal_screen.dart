import 'package:dumka/utils/const.dart';
import 'package:dumka/utils/dumka_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      body: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(15, 35.87, 15, 10),
          decoration: BoxDecoration(
            color: UIConfig.deepPurple300,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
              child: Text(
                ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse condimentum urna vel dolor sollicitudin accumsan. In auctor finibus diam, quis malesuada mi congue in. Sed dignissim sollicitudin tortor eu mollis. Proin sagittis ex eu tempor tristique. Nullam feugiat mi eget tincidunt euismod. Ut vel nisi vitae lectus maximus finibus sit amet nec tortor. Vestibulum at augue at justo pellentesque dapibus eget id odio. Suspendisse ultrices sed dui sed mattis. Praesent elementum in tellus quis malesuada. Nullam commodo vulputate feugiat.',
                style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
              ),
            ),
            Row(children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  height: 60,
                  width: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(3),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: 50,
                          height: 50,
                          child: Column(children: <Widget>[
                            const Icon(MdiIcons.fileOutline,
                                color: Colors.white, size: 40),
                            Text(
                              'file $index',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          ]));
                    },
                  )),
              const Spacer(),
            ])
          ]),
        ),
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
      ]),
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
}
