import 'dart:developer' as dev;

import 'package:flutter/widgets.dart';

abstract class Logger {
  static void log(String text) => dev.log(text, name: 'my.log');
  static void net(String text) => dev.log(text, name: 'my.net');
  static void nav(String text) => dev.log(text, name: 'my.nav');
  static void state(String text) => dev.log(text, name: 'my.state');
  static void storage(String text) => dev.log(text, name: 'my.storage');
}

class NavigatorLogger extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    Logger.nav('pop route: ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    Logger.nav('push route: ${route.settings.name}');
  }
}
