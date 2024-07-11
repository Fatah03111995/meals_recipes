import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyTheme appColor =
        context.watch<ThemeCubit>().state.modeThemes ?? ModeThemes.lightMode;
    Future.delayed(
      const Duration(milliseconds: 5000),
      () => Navigator.pushReplacementNamed(context, PathRoute.welcome),
      // () => Navigator.pushReplacementNamed(context, PathRoute.welcome),
    );

    return Scaffold(
      backgroundColor: appColor.scaffoldBgColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 250.h,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30.w),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: appColor.primaryColor.withOpacity(0.7)),
                  child: Assets.ui.logo
                      .image(width: 120.w, height: 120.w, fit: BoxFit.contain),
                ),
                SizedBox(height: 20.h),
                DefaultTextStyle(
                  style: Textstyles.mlBold.copyWith(color: appColor.textColor),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FadeAnimatedText('Meals Recipes'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
