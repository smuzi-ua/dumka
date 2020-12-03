import 'dart:developer';

import 'package:dumka/bloc/school/school_bloc.dart';
import 'package:dumka/bloc/school/school_event.dart';
import 'package:dumka/bloc/school/school_state.dart';
import 'package:dumka/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

var _schoolBloc = SchoolBloc();

class SplashScreen extends StatelessWidget {
  SplashScreen() {
    // Make request
    _schoolBloc.add(SchoolListFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SizedBox(
              child: Text('BYE!'),
            ),
          ));
    });

    return Scaffold(backgroundColor: Colors.white, body: SchoolFetcher());
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}

// Exmaple of BLoC
class SchoolFetcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolListState>(
      cubit: _schoolBloc,
      builder: (BuildContext context, SchoolListState state) {
        log(state.toString());
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

// class SplashScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Future.delayed(const Duration(seconds: 1), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProposalsScreen(),
//           ));
//     });
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: <Widget>[
//           SizedBox(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SvgPicture.asset('assets/splash.svg'),
//                 const SizedBox(height: 32),
//                 Text(
//                   Texts.splashTitle,
//                   style: TextStyle(color: Colors.grey[900], fontSize: 32.0),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   Texts.splashSubtitle,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey[700], fontSize: 18.0),
//                 )
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 64),
//               child: SizedBox(
//                 height: 22,
//                 width: 22,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 3,
//                   valueColor:
//                   AlwaysStoppedAnimation<Color>(UIConfig.primaryColor),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
