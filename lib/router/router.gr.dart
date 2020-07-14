// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:todoapps/Authentication/Wrapper.dart';
import 'package:todoapps/app_screens/home.dart';
import 'package:todoapps/Widgets/Loading.dart';
import 'package:todoapps/Authentication/SignIn.dart';

abstract class Routes {
  static const wrapper = '/';
  static const home = '/home';
  static const loading = '/loading';
  static const signIn = '/sign-in';
  static const all = {
    wrapper,
    home,
    loading,
    signIn,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.wrapper:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Wrapper(),
          settings: settings,
        );
      case Routes.home:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Home(),
          settings: settings,
        );
      case Routes.loading:
        return MaterialPageRoute<dynamic>(
          builder: (context) => Loading(),
          settings: settings,
        );
      case Routes.signIn:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignIn(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
