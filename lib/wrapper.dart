import 'package:dumka/bloc/school/school_bloc.dart';
import 'package:dumka/bloc/school/school_state.dart';
import 'package:dumka/ui/screens/auth/auth_screen.dart';
import 'package:dumka/utils/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

// here is all the logic of the app
class Wrapper extends StatelessWidget {
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
        return _LoadingScreen();
      },
    );
  }

  void pushToProposalsScreens(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AuthorizationScreen(),
          ));
    });
  }
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

var _schoolBloc = SchoolBloc();
//
// class SplashScreen extends StatelessWidget {
//   SplashScreen() {
//     // Make request
//     _schoolBloc.add(SchoolListFetchEvent());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 4), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const SizedBox(
//               child: Text('BYE!'),
//             ),
//           ));
//     });
//
//     return Scaffold(backgroundColor: Colors.white, body: SchoolFetcher());
//   }
// }

// todo display status messages on the main screen like this
// Exmaple of BLoC
class SchoolFetcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolListState>(
      bloc: _schoolBloc,
      builder: (BuildContext context, SchoolListState state) {
        //log(state.toString());
        if (state is SchoolListEmptyState) {
          return const Center(child: Text('Empty Schools!'));
        } else if (state is SchoolListErrorState) {
          return const Center(child: Text('Error!'));
        } else if (state is SchoolListFetchedState) {
          return Center(child: Text('Schools: ${state.schools}'));
        } else if (state is SchoolListFetchingState) {
          return const Center(child: Text('Loading'));
        } else {
          return const Center(child: Text('Unknown'));
        }
      },
    );
  }
}
