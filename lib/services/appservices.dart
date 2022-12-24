// ignore: non_constant_identifier_names
// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String LOGIN_KEY = "5FD6G46SDF4GD64F1VG9SD68";
String ONBOARD_KEY = "GD2G82CG9G82VDFGVD22DVG";

class AppService with ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  final StreamController<bool> _loginStateChange =
      StreamController<bool>.broadcast();

  bool _loginState = false;
  bool _initialized = false;

  AppService(this.sharedPreferences);

  bool get loginState => _loginState;
  bool get initialized => _initialized;
  Stream<bool> get loginStateChange => _loginStateChange.stream;

  set loginState(bool state) {
    sharedPreferences.setBool(LOGIN_KEY, state);
    _loginState = state;
    _loginStateChange.add(state);
    notifyListeners();
  }

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _loginState = sharedPreferences.getBool(LOGIN_KEY) ?? false;
    await Future.delayed(const Duration(seconds: 2));

    _initialized = true;
    notifyListeners();
  }
}
