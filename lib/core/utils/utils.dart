import 'dart:io';

import 'package:flutter/material.dart';

import '../../data/sources/local/sharedpreferences.dart';

class Utiles {
  static bool isLogin = true;
  static ThemeMode appMode = ThemeMode.light;
  static String token = "";
  static String name = "";

  static String apiUrl = "https://technichal.prominaagency.com/api/";
}
