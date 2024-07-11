import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/lib.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialTheme());

  void changeMode() {
    Global.globalPreferences.changeMode();
    state is DarkTheme ? emit(LightTheme()) : emit(DarkTheme());
  }

  void emitDarkMode() {
    emit(DarkTheme());
  }

  void emitLightMode() {
    emit(LightTheme());
  }
}
