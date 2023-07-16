import 'dart:developer';

import 'package:flutter/material.dart';

import 'navigator_state.dart';

class NavigationInformationParser
    extends RouteInformationParser<NavigatorConfigState> {
  @override
  RouteInformation? restoreRouteInformation(
      NavigatorConfigState configuration) {
    if (configuration is NavigatorTaskState) {
      return RouteInformation(location: '/editscreen/${configuration.id}');
    } else {
      return const RouteInformation(location: '/listscreen');
    }
  }

  @override
  Future<NavigatorConfigState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final url = Uri.parse(routeInformation.location);
    log(url.pathSegments.toString());
    if (url.pathSegments.isNotEmpty) {
      if (url.pathSegments.first == 'editscreen') {
        if (url.pathSegments.length > 2) {
          if (url.pathSegments[1].isNotEmpty) {
            final id = url.pathSegments[1];
            return NavigatorTaskState(id: id);
          }
        }
      } else if (url.pathSegments.first == 'create') {
        return NavigatorTaskState(id: null, isNew: true);
      }
    }
    return NavigatorListState();
  }
}
