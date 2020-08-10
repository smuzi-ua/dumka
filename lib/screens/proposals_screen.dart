import 'package:Dumka/utils/const.dart';
import 'package:Dumka/utils/dumka_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                        Icons.attach_file,
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
                          icon: const Icon(Icons.account_circle),
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
                        icon: const Icon(Icons.settings),
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
                        icon: const Icon(Icons.message),
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
          showAddSuggestionWindow(context);
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
