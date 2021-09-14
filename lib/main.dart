import 'package:dumka/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/screens/about_screen.dart';
import 'ui/screens/account_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'utils/const.dart';
import 'wrapper.dart';

void main() {
  runApp(MyApp());
}

// todo theming
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // todo use routes & loading bloc for navigating authed/not authed
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: MaterialApp(
          builder: (_, child) {
            return ScrollConfiguration(
              behavior: RemoveAnnoyingScrollBehaviour(),
              child: child,
            );
          },
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/user_profile': (context) => AccountScreen(),
            '/settings': (context) => SettingsScreen(),
            '/about': (context) => AboutScreen(),
          },
          title: Texts.title,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.grey,
            primaryTextTheme:
                const TextTheme(headline6: TextStyle(color: Colors.white)),
          )),
    );
  }
}

class RemoveAnnoyingScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
