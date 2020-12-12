import 'package:dumka/utils/const.dart';
import 'package:dumka/utils/dumka_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class UserWrapper extends StatefulWidget {
  @override
  _UserWrapperState createState() => _UserWrapperState();
}

class _UserWrapperState extends State<UserWrapper>
    with TickerProviderStateMixin {
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

  ScrollController _scroll;
  TabController _mainTabs;
  TabController _secondaryTabsMain;
  TabController _secondaryTabsSecond;
  PageController _pager;
  TabController _submenuTabs;

  @override
  void initState() {
    _mainTabs = TabController(length: 2, vsync: this);
    _secondaryTabsMain = TabController(length: 3, vsync: this);
    _secondaryTabsSecond = TabController(length: 1, vsync: this);
    _pager = PageController();
    _submenuTabs = TabController(vsync: this, length: 2);
    _scroll = ScrollController();

    _pager.addListener(() {
      if (_pager.page < 1) {
        if(!_secondaryTabsMain.indexIsChanging){
          _secondaryTabsMain.index = 0;
          _secondaryTabsMain.offset = _pager.page;
        }

        _submenuTabs.index = 0;

        return;
      }

      if (_pager.page < 2) {
        if(!_secondaryTabsMain.indexIsChanging){
          _secondaryTabsMain.index = 1;
          _secondaryTabsMain.offset = _pager.page - 1;
        }

        _submenuTabs.index = 0;

        return;
      }

      if (_pager.page < 3) {
        if (!_mainTabs.indexIsChanging) {
          _mainTabs.index = _pager.page - 2 > 0.5 ? 1 : 0;
          _mainTabs.offset = _pager.page - 2;
        }

        _secondaryTabsMain.index = 2;
        _submenuTabs.index = _pager.page - 2 > 0.5 ? 1 : 0;

        return;
      }
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: UIConfig.bgColor,
      body: Stack(children: [
        PageView(
          controller: _pager,
          children: [
            Center(
              child: Text(
                '1',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                '2',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                '3',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
            Center(
              child: Text(
                '4',
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
          ],
        ),
        // TabBarView(
        //
        //
        //   controller: _mainTabs,
        //   children: [
        //     TabBarView(
        //     controller: _secondaryTabs,
        //     children: [
        //       ProposalsWidget(_scroll),
        //       Center(
        //         child: Text(
        //           'В процесі',
        //           style: GoogleFonts.roboto(fontSize: 16),
        //         ),
        //       ),
        //       Center(
        //         child: Text(
        //           'Архів',
        //           style: GoogleFonts.roboto(fontSize: 16),
        //         ),
        //       ),
        //     ],
        //   ),
        //     Center(
        //       child: Text(
        //         '...',
        //         style: GoogleFonts.roboto(fontSize: 16),
        //       ),
        //     ),
        //   ]
        //
        // ),
        AnimatedBuilder(
          animation: _scroll,
          builder: (_, child) {
            try {
              if (_scroll.offset == 0) {
                throw Exception();
              }

              return TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 200),
                  tween: _scroll.position.userScrollDirection ==
                          ScrollDirection.reverse
                      ? Tween(begin: 104, end: 0)
                      : Tween(begin: 0, end: 104),
                  builder: (_, value, __) {
                    return Transform.translate(
                      offset: Offset(
                          0, -MediaQuery.of(context).size.height + value),
                      child: child,
                    );
                  });
            } catch (_) {
              return SizedBox(height: 104, child: child);
            }
          },
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(18),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // todo proper tabs & navigation
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 44,
                    child: TabBar(
                      controller: _mainTabs,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                      unselectedLabelColor: Colors.grey[500],
                      onTap: (i) {
                        // todo fix weird logic when clicking on the second tab directly

                        _pager.animateToPage(i == 0 ? 2 : 3,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      },
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
                  SizedBox(
                    height: 30,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _submenuTabs,
                      children: [
                        TabBar(
                          controller: _secondaryTabsMain,
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          unselectedLabelColor: Colors.grey[500],
                          labelColor: Colors.deepPurple.shade700,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          onTap: (i) {
                            // if(i == 0){
                            //   print('123123');
                            //   _pager.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.linear);
                            //
                            // }
                            // print('tap!!!');

                              _pager.animateToPage(i,
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.linear);

                          },
                          indicator: MD2Indicator(
                              indicatorHeight: 2.4,
                              indicatorColor: Colors.deepPurple.shade700,
                              indicatorSize: MD2IndicatorSize.normal),
                          tabs: const [
                            Tab(text: 'Активні'),
                            Tab(text: 'В процесі'),
                            Tab(text: 'Архів'),
                          ],
                        ),
                        TabBar(
                          controller: _secondaryTabsSecond,
                          isScrollable: true,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          unselectedLabelColor: Colors.grey[500],
                          labelColor: Colors.deepPurple.shade700,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          indicator: MD2Indicator(
                              indicatorHeight: 2.4,
                              indicatorColor: Colors.deepPurple.shade700,
                              indicatorSize: MD2IndicatorSize.normal),
                          tabs: const [
                            Tab(text: 'Всі'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedBuilder(
        animation: _scroll,
        builder: (_, child) {
          try {
            if (_scroll.offset == 0) {
              throw Exception();
            }

            return TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 200),
                tween: _scroll.position.userScrollDirection ==
                        ScrollDirection.reverse
                    ? Tween(begin: 1, end: 0)
                    : Tween(begin: 0, end: 1),
                builder: (_, value, __) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                });
          } catch (_) {
            return child;
          }
        },
        child: FloatingActionButton(
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
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _scroll,
        builder: (_, child) {
          try {
            return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: _scroll.position.userScrollDirection ==
                        ScrollDirection.reverse
                    ? 0
                    : 54,
                child: child);
          } catch (_) {
            return child;
          }
        },
        child: BottomAppBar(
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
