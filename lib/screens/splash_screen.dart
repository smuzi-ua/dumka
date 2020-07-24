import 'package:Dumka/screens/proposals_screen.dart';
import 'package:Dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProposalsScreen(),
          ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset('assets/splash.svg'),
                const SizedBox(height: 32),
                Text(
                  Texts.splashTitle,
                  style: TextStyle(color: Colors.grey[900], fontSize: 32.0),
                ),
                const SizedBox(height: 16),
                Text(
                  Texts.splashSubtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[700], fontSize: 18.0),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 64),
              child: SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: UIConfig.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
