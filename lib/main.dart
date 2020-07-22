import 'file:///C:/Users/Roman/IdeaProjects/Dumka/lib/screens/splash_screen.dart';
import 'package:Dumka/utils/const.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen()
    );
  }
}
