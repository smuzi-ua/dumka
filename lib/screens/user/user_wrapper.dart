import 'package:dumka/screens/components/bottom_sheet.dart';
import 'package:dumka/screens/user/add_suggestion_widget.dart';
import 'package:dumka/screens/user/user_settings_widget.dart';
import 'package:dumka/utils/const.dart';
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
        if (!_secondaryTabsMain.indexIsChanging) {
          _secondaryTabsMain.index = 0;
          _secondaryTabsMain.offset = _pager.page;
        }

        _submenuTabs.index = 0;

        return;
      }

      if (_pager.page < 2) {
        if (!_secondaryTabsMain.indexIsChanging) {
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
            // Center(
            //   child: Text(
            //     '1',
            //     style: GoogleFonts.roboto(fontSize: 16),
            //   ),
            // ),
            ListView(
              controller: _scroll,
              padding: const EdgeInsets.symmetric(vertical: 120),
              children: [
                Container(
                  height: 400,
                  color: Colors.red,
                  width: double.infinity,
                ),
                Container(
                  height: 400,
                  color: Colors.blue,
                  width: double.infinity,
                ),
                Container(
                  height: 400,
                  color: Colors.green,
                  width: double.infinity,
                ),
              ],
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
                      ? Tween(begin: 112, end: 0)
                      : Tween(begin: 0, end: 112),
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
            DumkaBottomSheet.show(context, AddSuggestionWidget());
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
                    DumkaBottomSheet.show(context, UserSettingsWidget());
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
