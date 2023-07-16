import 'dart:ui';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../assets/theme/theme.dart';

class RemoteConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  RemoteConfigService() {
    _initRemoteConfig();
  }

  Future<void> _initRemoteConfig() async {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 1),
      ),
    );
    await remoteConfig.setDefaults({
      "importance_color": '0xFFFF3B30',
    });
    await remoteConfig.fetchAndActivate();
  }

  Color get getColor =>
      HexColor.fromHex(remoteConfig.getString("importance_color")) ??
      AppTheme.red;
  String get getStringColor => remoteConfig.getString("importance_color");
}

extension HexColor on Color {
  static Color? fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    try {
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return null;
    }
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
