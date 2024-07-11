// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_recipes/core/themes/my_colors.dart';

class ModeThemes {
  static MyTheme get darkMode => MyTheme(
        primaryColor: MyColors.blue1,
        secondaryColor: MyColors.dark900,
        textColor: Colors.white,
        secondaryTextColor: MyColors.dark900,
        containerColor: MyColors.dark700,
        secondaryContainerColor: MyColors.blue4,
        buttonColor: MyColors.blue1,
        secondaryButtonColor: MyColors.dark700,
        scaffoldBgColor: MyColors.dark900,
      );
  static MyTheme get lightMode => MyTheme(
        primaryColor: MyColors.blue1,
        secondaryColor: MyColors.dark100,
        textColor: MyColors.dark900,
        secondaryTextColor: MyColors.dark100,
        containerColor: Colors.white,
        secondaryContainerColor: MyColors.blue1,
        buttonColor: MyColors.blue1,
        secondaryButtonColor: MyColors.dark100,
        scaffoldBgColor: MyColors.blue4,
      );
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

class MyTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final Color secondaryTextColor;
  final Color containerColor;
  final Color secondaryContainerColor;
  final Color buttonColor;
  final Color secondaryButtonColor;
  final Color scaffoldBgColor;
  const MyTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.textColor,
    required this.secondaryTextColor,
    required this.containerColor,
    required this.secondaryContainerColor,
    required this.buttonColor,
    required this.secondaryButtonColor,
    required this.scaffoldBgColor,
  });
}
