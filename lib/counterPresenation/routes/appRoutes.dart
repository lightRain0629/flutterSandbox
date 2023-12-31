import 'package:flutter/material.dart';
import 'package:flutter_bloc_tests/counterPresenation/counterTestScreens/homePage.dart';
import 'package:flutter_bloc_tests/counterPresenation/counterTestScreens/secondPage.dart';
import 'package:flutter_bloc_tests/counterPresenation/counterTestScreens/settingsPage.dart';
import 'package:flutter_bloc_tests/counterPresenation/counterTestScreens/thirdPage.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../counterTestScreens/gridViewTest.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return PageTransition(
              isIos: true,
              child: HomePage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );

      case '/second':
        return PageTransition(
              isIos: true,
              child: SecondPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );

      case '/third':
        return PageTransition(
              isIos: true,
              child: ThirdPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );

      case '/settings':
        return PageTransition(
              isIos: true,
              child: SettingPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
      default:
        return PageTransition(
              isIos: true,
              child: SettingPage(),
              type: PageTransitionType.rightToLeft,
              settings: routeSettings,
              duration: Duration(milliseconds: 400),
              reverseDuration: Duration(milliseconds: 400)
            );
    }
  }
}
