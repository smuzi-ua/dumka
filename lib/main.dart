import 'package:Dumka/utils/const.dart';
import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo use routes & loading bloc for navigating authed/not authed
    return MaterialApp(
        title: Texts.title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen());
  }
}
