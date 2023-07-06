import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class RevisionPrefService {

  Future<int> getRevision() async{
    final sharedPref=await SharedPreferences.getInstance();
    int? revision=sharedPref.getInt('network_revisions');
    log('LOCAL REVISION $revision');
    return revision?? 0;
  }
  Future<bool> saveRevision({required int revision}) async{
    log('SAVE LOCAL REVISION $revision');
    final sharedPref=await SharedPreferences.getInstance();
    return sharedPref.setInt('network_revisions', revision);

  }
}