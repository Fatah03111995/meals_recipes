import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 5000),
      () => Navigator.pushReplacementNamed(context, PathRoute.welcome),
    );

    return Scaffold(
      backgroundColor: MyColors.blue1,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 200.h,
            child: Column(
              children: [
                Assets.ui.logo
                    .image(width: 150.w, height: 150.w, fit: BoxFit.contain),
                SizedBox(height: 20.h),
                DefaultTextStyle(
                  style: Textstyles.mlBold.copyWith(color: Colors.white),
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
