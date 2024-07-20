import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/lib.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
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
              child: SizedBox(
                width: 320.w,
                child: CustomScrollView(slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight.h)),
                  SliverToBoxAdapter(
                    child: Row(
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
                          ],
                        )
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      'Recomendation for you',
                      style: Textstyles.sm.copyWith(
                        color: appColor.textColor,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 300.w,
                      child: BlocBuilder<RecipiesBloc, RecipiesState>(
                        builder: (context, state) {
                          return PageView.builder(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              List<Meal> meals = [];
                              if (state is RecipiesStateLoading) {
                                CircularProgressIndicator(
                                  color: appColor.textColor,
                                );
                              }

                              if (state is RecipiesStateSuccess) {
                                meals = state.listMeal;
                              }

                              return MealCardLarge(data: meals[index + 2]);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      'More You Might Like',
                      style: Textstyles.sm.copyWith(color: appColor.textColor),
                    ),
                  ),
                  BlocSelector<RecipiesBloc, RecipiesState, List<Meal>>(
                    selector: (state) {
                      if (state is RecipiesStateSuccess) {
                        return state.listMeal;
                      }
                      return [];
                    },
                    builder: (context, meals) {
                      return SliverGrid.builder(
                        itemCount: meals.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.57,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          Meal meal = meals[index];
                          return MealCard(data: meal);
                        },
                      );
                    },
                  )
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
