import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

@immutable
class DumkaModalSheet extends StatefulWidget {
  final Color backgroundColor;
  final Widget child;

  const DumkaModalSheet({this.child, this.backgroundColor});

  @override
  _DumkaModalSheetState createState() => _DumkaModalSheetState();

  static void show(
      {@required BuildContext context,
      @required Widget child,
      Color backgroundColor = const Color(0xb3212121)}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) {
              return DumkaModalSheet(
                backgroundColor: backgroundColor,
                child: child,
              );
            },
            opaque: false));
  }
}

class _DumkaModalSheetState extends State<DumkaModalSheet>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  CurvedAnimation _curvedAnimation;

//  Animation<Color> _colorTween;

  final GlobalKey _childKey = GlobalKey();

  double get _childHeight {
    final renderBox = _childKey.currentContext.findRenderObject() as RenderBox;
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      _animationController.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _animation = Tween<double>(begin: 1.3, end: 0).animate(_curvedAnimation);
//    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54)
//        .animate(_curvedAnimation);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) Navigator.pop(context);
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (_dismissUnderway) return;

    final change =
        details.primaryDelta / (_childHeight ?? details.primaryDelta);
    _animationController.value -= change;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;

    if (details.velocity.pixelsPerSecond.dy < 0) return;

    // todo tf does this do
    if (details.velocity.pixelsPerSecond.dy > 700) {
      final flingVelocity = -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (_animationController.value > 0) {
        _animationController.fling(velocity: flingVelocity);
      }
    } else if (_animationController.value < 0.5) {
      if (_animationController.value > 0.0) {
        _animationController.fling(velocity: -1.0);
      }
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const prpl = Color(0xAA651FFF);
    return WillPopScope(
        onWillPop: onBackPressed,
        child: GestureDetector(
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          excludeFromSemantics: true,
          child: Scaffold(
            backgroundColor: widget.backgroundColor,
            body: SafeArea(
              child: Column(
                key: _childKey,
                children: <Widget>[
                  const Spacer(),
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, _) {
                        return Transform(
                          transform: Matrix4.translationValues(
                              0.0, width * _animation.value, 0.0),
                          child: Container(
                            height: 500,
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Positioned(
                                  top: 27.5,
                                  height: 500,
                                  width: width,
                                  child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {},
                                      child: Container(
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/bottom_sheet_template.png'),
                                                  fit: BoxFit.fill),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25.0))),
                                          child: widget.child)),
                                ),
                                FloatingActionButton(
                                  onPressed: onBackPressed,
                                  backgroundColor: prpl,
                                  child: const Icon(
                                    MdiIcons.close,
                                    color: Colors.white,
                                    size: 26.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool> onBackPressed() {
    _animationController.reverse();
    return Future<bool>.value(false);
  }
}
