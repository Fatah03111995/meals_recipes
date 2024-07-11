import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/lib.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialTheme(ModeThemes.lightMode));

  void changeMode() {
    state is DarkTheme ? emit(LightTheme()) : emit(DarkTheme());
  }
}
