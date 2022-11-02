import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/sources/local/sharedpreferences.dart';

class Utiles {
  static bool isLogin = true;
  static ThemeMode appMode = ThemeMode.light;
  static RegExp doubleNumRegEx = RegExp(r'(^\d*\.?\d*)');
  static RegExp intNumRegEx = RegExp(r'(^\d*)');
  static String token = "";
  static String UserId = "";
  static String name = "";

  static String apiUrl = "https://technichal.prominaagency.com/api/";

  static logout() {
    token = "";
    UserId = "";
    name = "";

    CacheHelper.sharedPreferences.clear();
  }

  static removeToken() {
    token = "";
    CacheHelper.removeData(key: "token");
  }
}
