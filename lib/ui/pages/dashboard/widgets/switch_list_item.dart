// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';

class SwitchListItem extends StatelessWidget {
  final MyTheme appColor;
  final String title;
  final String subtitle;
  final bool value;
  final void Function(bool) onChanged;
  const SwitchListItem({
    super.key,
    required this.appColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: Textstyles.mBold.copyWith(color: appColor.textColor),
      ),
      subtitle: Text(
        subtitle,
        style: Textstyles.xs.copyWith(color: appColor.textColor),
      ),
      activeColor: appColor.primaryColor,
    );
  }
}

class SwitchItemData {
  final String title;
  final String subtitle;

  const SwitchItemData({required this.title, required this.subtitle});
}
