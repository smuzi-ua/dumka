import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class DumkaModalSheet extends StatefulWidget {

  final Color backgroundColor;
  final Widget child;

  DumkaModalSheet({this.child,  this.backgroundColor});

  @override
  _DumkaModalSheetState createState() => _DumkaModalSheetState();

  static show(
      {@required BuildContext context,
        @required child,
        backgroundColor = const Color(0xb3212121)}) {
    Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) {
              return DumkaModalSheet(
                child: child,
                backgroundColor: backgroundColor,
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
  Animation<Color> _colorTween;

  final GlobalKey _childKey = GlobalKey();

  double get _childHeight {
    final RenderBox renderBox = _childKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  bool get _dismissUnderway =>
      _animationController.status == AnimationStatus.reverse;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 140));
    _curvedAnimation = CurvedAnimation(parent:_animationController, curve:  Interval(0, 0.140, curve: Curves.easeOut));
    _animation = Tween<double>(begin: 1.3, end: 0).animate(_curvedAnimation);
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.black54).animate(_curvedAnimation);

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

    var change = details.primaryDelta / (_childHeight ?? details.primaryDelta);
      _animationController.value -= change;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_dismissUnderway) return;

    if (details.velocity.pixelsPerSecond.dy < 0 ) return;

    if (details.velocity.pixelsPerSecond.dy > 700) {
      final double flingVelocity =
          -details.velocity.pixelsPerSecond.dy / _childHeight;
      if (_animationController.value > 0.0)
        _animationController.fling(velocity: flingVelocity);
    } else if (_animationController.value < 0.5) {
      if (_animationController.value > 0.0)
        _animationController.fling(velocity: -1.0);
    } else
      _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Color prpl = const Color(0xAA651FFF);
    return WillPopScope(
        onWillPop: onBackPressed,
        child: GestureDetector(
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd: _handleDragEnd,
          child: Scaffold(
            backgroundColor: widget.backgroundColor,
            body: SafeArea(
              child: Column(
                key: _childKey,
                children: <Widget>[
                  Spacer(),
                AnimatedBuilder(
                        animation: _animation,
                        builder: (context, _) {
                          return Transform(
                            transform: Matrix4.translationValues(
                                0.0, width * _animation.value, 0.0),
                            child: Container(
                              height: 500,
                              width:double.infinity,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[

                                  Positioned(
                                    top:27.5,
                                    height: 500,
                                    width: width,
                                    child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {},
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                image: DecorationImage(
                                                    image: AssetImage("images/Subtract.png"),
                                                  fit: BoxFit.fill
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(25.0))),
                                            child:widget.child)),
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: prpl,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 55.0,
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
          excludeFromSemantics: true,
        ));
  }


  Future<bool> onBackPressed() {
    _animationController.reverse();
    return Future<bool>.value(false);
  }
}

