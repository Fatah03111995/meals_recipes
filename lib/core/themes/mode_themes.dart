import 'package:flutter/material.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';

class ModeThemes {
  static ThemeData get dark => ThemeData.dark();
  static ThemeData get light =>
      ThemeData.light().copyWith(colorScheme: MyColors.blueScheme);
}
