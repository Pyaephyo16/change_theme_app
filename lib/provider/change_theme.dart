import 'package:change_theme_app/utils/shared_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChangeTheme extends ChangeNotifier{

    ThemeMode themeMode = ThemeMode.light;
    String? name;

    CheckThemeData(){
      SharedPref.getData(key: "theme").then((value){
          if(value!=null){
              if(value == "dark"){
                themeMode = ThemeMode.dark;
                name = "dark";
              }else if(value == "light"){
                themeMode = ThemeMode.light;
                name = "light";
              }else{
                themeMode = ThemeMode.system;
                name = "system";
              }
              notifyListeners();
          }
      });
    }

    ChangeDarkTheme(){
      themeMode = ThemeMode.dark;
      name = "dark";
      SharedPref.setData(key: "theme",value: "dark");
      SharedPref.setData(key: "name", value: "dark");
      notifyListeners();
    }

    ChangeLightTheme(){
      themeMode = ThemeMode.light;
      name = "light";
      SharedPref.setData(key: "theme",value: "light");
      SharedPref.setData(key: "name", value: "light");
      notifyListeners();
    }

    ChangeSystemTheme(){
      themeMode = ThemeMode.system;
      name = "system";
      SharedPref.setData(key: "theme",value: "system");
      SharedPref.setData(key: "name", value: "system");
      notifyListeners();
    }
}