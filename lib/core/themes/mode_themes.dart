import 'package:flutter/material.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';

class ModeThemes {
  static ThemeData get dark => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: MyColors.dark900,
        cardColor: MyColors.dark900, // container
        primaryColor: MyColors.blue1,
        primaryColorDark: MyColors.dark800,
        primaryColorLight: MyColors.dark100,
      );
  static ThemeData get light => ThemeData.light().copyWith(
        scaffoldBackgroundColor: MyColors.blue4,
        cardColor: Colors.white,
        primaryColor: MyColors.blue1,
        primaryColorDark: MyColors.dark100,
        primaryColorLight: MyColors.dark800,
      );
}
