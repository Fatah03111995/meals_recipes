import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/lib.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(modeThemes: LightMode()));

  void changeMode() {
    Global.globalPreferences.changeMode();
    state.modeThemes is DarkMode ? emitLightMode() : emitDarkMode();
  }

  void emitDarkMode() {
    emit(ThemeState(modeThemes: DarkMode()));
  }

  void emitLightMode() {
    emit(ThemeState(modeThemes: LightMode()));
  }

  @override
  void onChange(Change<ThemeState> change) {
    super.onChange(change);
  }
}
