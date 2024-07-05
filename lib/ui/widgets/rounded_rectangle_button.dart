import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';

class RoundedRectangleButton extends StatelessWidget {
  final Widget? titleButton;
  final String text;
  final void Function() onTap;

  const RoundedRectangleButton({
    this.titleButton,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Material(
        color: MyColors.blue1,
        borderRadius: BorderRadius.circular(20.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.w),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.2),
          child: Center(
            child: titleButton ??
                Text(
                  text,
                  style: Textstyles.smBold.copyWith(color: Colors.white),
                ),
          ),
        ),
      ),
    );
  }
}
