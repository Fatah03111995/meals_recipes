// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/lib.dart';

abstract class ThemeState {
  final ThemeData? modeThemes;
  const ThemeState({
    this.modeThemes,
  });
}

class InitialTheme extends ThemeState {
  late ThemeData? loadData;
  InitialTheme({this.loadData}) : super(modeThemes: loadData) {
    bool isDarkMode = Global.globalPreferences.getIsDarkMode();
    loadData = isDarkMode ? ModeThemes.dark : ModeThemes.light;
  }
}

class DarkTheme extends ThemeState {
  DarkTheme() : super(modeThemes: ModeThemes.dark);
}

class LightTheme extends ThemeState {
  LightTheme() : super(modeThemes: ModeThemes.light);
}
