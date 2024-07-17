import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';

class InputText extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final Widget? suffixIcon;
  final bool isVisible;
  final void Function(String?) onChanged;
  const InputText(
      {super.key,
      required this.label,
      required this.hint,
      this.icon,
      required this.onChanged,
      this.suffixIcon,
      this.isVisible = true});

  @override
  Widget build(BuildContext context) {
    MyTheme appColor = ModeThemes.lightMode;

    return Container(
      height: 50.w,
      decoration: BoxDecoration(
        color: appColor.containerColor,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: TextField(
        onChanged: onChanged,
        obscureText: !isVisible,
        style: Textstyles.sm.copyWith(color: appColor.textColor),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Textstyles.smBold.copyWith(color: appColor.textColor),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          hintText: hint,
          hintStyle: Textstyles.sm
              .copyWith(color: appColor.textColor.withOpacity(0.5)),
          prefixIcon: icon != null
              ? Align(
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    color: appColor.textColor,
                  ),
                )
              : null,
          prefixIconConstraints: icon != null
              ? BoxConstraints(maxWidth: 40.w, maxHeight: 30.w)
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: BorderSide(
                color: appColor.textColor.withOpacity(0.5), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: BorderSide(color: appColor.textColor, width: 2),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
