import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/bloc/user/user.dart';
import 'package:meals_recipes/core/data/dummy.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';
import 'package:meals_recipes/core/data/models/user_model.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';
import 'package:meals_recipes/ui/widgets/meal_card.dart';
import 'package:meals_recipes/ui/widgets/meal_card_large.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user;
    UserState state = context.watch<UserBloc>().state;
    MyTheme appColor =
        context.watch<ThemeCubit>().state.modeThemes ?? ModeThemes.lightMode;
    List<Meal> meals = dummyMeals;

    if (state is UserStateDone) {
      user = state.user;
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 340.w,
              height: 100.h,
              color: Colors.yellow[300],
            )),
        Positioned(
            top: 80.h,
            left: 0,
            child: Container(
              width: 340.w,
              height: 150.h,
              color: Colors.blue[200],
            )),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 100,
            sigmaY: 100,
          ),
          child: Container(
            color: Colors.transparent,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 320.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: kToolbarHeight.h),
                    Row(
                      children: [
                        ClipOval(
                          child: Assets.ui.defaultpp.image(
                            width: 100.w,
                            height: 100.w,
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: Textstyles.l.copyWith(
                                color: appColor.textColor,
                              ),
                            ),
                            if (user?.username != null)
                              Text(
                                user!.username,
                                style: Textstyles.xlBold.copyWith(
                                  color: appColor.textColor,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Recomendation for you',
                      style: Textstyles.sm.copyWith(
                        color: appColor.textColor,
                      ),
                    ),
                    SizedBox(
                      height: 300.w,
                      child: PageView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return MealCardLarge(data: dummyMeals[index + 2]);
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'More You Might Like',
                      style: Textstyles.sm.copyWith(color: appColor.textColor),
                    ),
                    GridView.builder(
                        itemCount: meals.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.57,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return MealCard(
                            data: meals[index],
                          );
                        }),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
