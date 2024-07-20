import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/lib.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
        return Center(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight.h),
            width: 320.w,
            child: Builder(builder: (context) {
              //------------------------------ SELECTION USER FAV
              List<String> userFav =
                  context.select<UserBloc, List<String>>((bloc) {
                UserState state = bloc.state;
                if (state is UserStateDone) {
                  return state.user.favourite;
                }
                return [];
              });

              bool isRecipiesStateLoading = false;
              List<Meal> allMeals =
                  context.select<RecipiesBloc, List<Meal>>((bloc) {
                RecipiesState recipiesState = bloc.state;
                if (recipiesState is RecipiesStateSuccess) {
                  isRecipiesStateLoading = false;
                  return recipiesState.listMeal;
                }
                if (recipiesState is RecipiesStateLoading) {
                  isRecipiesStateLoading = true;
                }
                return [];
              });

              List<Meal> userFavMeal = [
                ...allMeals.where((meal) {
                  return userFav.contains(meal.id);
                })
              ];

              if (isRecipiesStateLoading) {
                return CircularProgressIndicator(color: appColor.textColor);
              }

              if (userFavMeal.isEmpty) {
                return Text(
                  'No Data Here',
                  style: Textstyles.lBold.copyWith(color: appColor.textColor),
                );
              }

              return GridView.builder(
                  itemCount: userFavMeal.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.57,
                  ),
                  itemBuilder: (context, index) {
                    return MealCard(data: userFavMeal[index]);
                  });
            }),
          ),
        );
      },
    );
  }
}
