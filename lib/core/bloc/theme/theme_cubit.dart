import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/theme/theme_state.dart';
import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/lib.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialTheme());

  void changeTheme() {
    Global.globalPreferences.changeMode();
    bool isDarkMode = Global.globalPreferences.getIsDarkMode();
    isDarkMode ? emit(DarkTheme()) : emit(LightTheme());
  }
}
