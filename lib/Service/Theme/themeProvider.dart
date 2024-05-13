import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_project_/CommonWidget/theme.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleThemr(){
    if(_themeData == lightMode){
      _themeData = darkMode;
    }else{
      _themeData = lightMode;
    }
    notifyListeners();
  }
}