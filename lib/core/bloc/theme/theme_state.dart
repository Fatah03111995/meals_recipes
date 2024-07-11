// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meals_recipes/lib.dart';

abstract class ThemeState {
  final MyTheme? modeThemes;
  const ThemeState({
    this.modeThemes,
  });
}

class InitialTheme extends ThemeState {}

class DarkTheme extends ThemeState {
  DarkTheme() : super(modeThemes: ModeThemes.darkMode);
}

class LightTheme extends ThemeState {
  LightTheme() : super(modeThemes: ModeThemes.lightMode);
}
