import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefService{
  setTheme(bool value) async{
    SharedPreferences sharedPref=await SharedPreferences.getInstance();
    sharedPref.setBool('theme', value);
  }
  getTheme()async{
    SharedPreferences sharedPref=await SharedPreferences.getInstance();
    return sharedPref.getBool('theme')??false;
  }
}