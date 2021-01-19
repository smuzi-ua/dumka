import 'package:dumka/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // todo use routes & loading bloc for navigating authed/not authed
    return MaterialApp(
        builder: (_, child) {
          return ScrollConfiguration(
            behavior: RemoveAnnoyingScrollBehaviour(),
            child: child,
          );
        },
        title: Texts.title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: InitScreen());
  }
}

class RemoveAnnoyingScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
