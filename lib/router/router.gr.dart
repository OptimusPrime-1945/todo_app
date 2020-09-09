// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app_screens/initial_page.dart';

class Routes {
  static const String initialPage = '/';
  static const all = <String>{
    initialPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.initialPage, page: InitialPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    InitialPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InitialPage(),
        settings: data,
      );
    },
  };
}
