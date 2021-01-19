import 'package:dumka/screens/proposals_screen.dart';
import 'package:dumka/utils/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class InitScreen extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          pushToProposalsScreens(context);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
          pushToProposalsScreens(context);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return SplashScreen();
      },
    );
  }

  void pushToProposalsScreens(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ProposalsScreen(),
          ));
    });
  }

}

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SizedBox(
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
                  valueColor:
                      AlwaysStoppedAnimation<Color>(UIConfig.primaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
