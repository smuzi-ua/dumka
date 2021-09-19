import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/screens/auth/auth_screen.dart';
import 'ui/screens/main_screen.dart';
import 'utils/const.dart';

// here is all the logic of the app
class Wrapper extends StatelessWidget {
  final Widget _auth = AuthorizationScreen();
  final Widget _home = MainUserScreen();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          throw Exception('ERROR CONNECTING TO FIREBASE');
        } else if (snapshot.connectionState == ConnectionState.done) {
          FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
          final prefs = snapshot.data as SharedPreferences;

          // todo if token is valid
          if (prefs.containsKey(Prefs.tokenPref)) {
            return _home;
          }
          return _auth;
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return _LoadingScreen();
      },
    );
  }
}

Future<SharedPreferences> _init() async {
  await Firebase.initializeApp();

  return SharedPreferences.getInstance();
}

class _LoadingScreen extends StatelessWidget {
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
                ),
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
