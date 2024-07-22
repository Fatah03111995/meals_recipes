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
        return Container(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          width: 320.w,
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: kToolbarHeight.h),
                  width: 320.w,
                  child: BlocBuilder<RecipiesBloc, RecipiesState>(
                    builder: (context, state) {
                      List<Meal> meals = [];

                      if (state is RecipiesStateSuccess) {
                        meals = state.listMeal;
                      }

                      return BlocSelector<UserBloc, UserState, List<String>>(
                        selector: (state) {
                          if (state is UserStateDone) {
                            return state.user.favourite;
                          }
                          return [];
                        },
                        builder: (context, userFav) {
                          return Builder(builder: (context) {
                            List<Meal> userFavMeal = [
                              ...meals.where((meal) {
                                return userFav.contains(meal.id);
                              })
                            ];

                            if (state is RecipiesStateLoading) {
                              return CircularProgressIndicator(
                                  color: appColor.textColor);
                            }

                            if (userFavMeal.isEmpty) {
                              return Center(
                                child: Container(
                                  padding: EdgeInsets.all(20.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.w),
                                      color: appColor.containerColor
                                          .withOpacity(0.5)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        size: 50,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        'No Data Here',
                                        style: Textstyles.lBold.copyWith(
                                            color: appColor.textColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return GridView.builder(
                                itemCount: userFavMeal.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 0.57,
                                ),
                                itemBuilder: (context, index) {
                                  return MealCard(data: userFavMeal[index]);
                                });
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

              // ------------------ SEARCH AND FILTER SECTION
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  bool isAdvanceSearchActive = state.isAdvanceSearchActive;
                  bool isLoading = state.isLoading;

                  return Container(
                    color: appColor.scaffoldBgColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InputText(
                                label: 'Search',
                                hint: 'title...',
                                onChanged: (value) {
                                  context.read<SearchBloc>().add(
                                      SearchEventOnChangeTitle(
                                          title: value ?? ''));
                                },
                                suffixIcon: !isAdvanceSearchActive
                                    ? isLoading
                                        ? CircularProgressIndicator(
                                            color: appColor.primaryColor,
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              context.read<SearchBloc>().add(
                                                  const SearchEventSearch(
                                                      listData: dummyMeals));
                                            },
                                            icon: Icon(
                                              Icons.search,
                                              color: appColor.primaryColor,
                                            ))
                                    : null,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            IconButton.filled(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      appColor.primaryColor),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.w),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.tune,
                                  size: 30,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        if (isAdvanceSearchActive) SizedBox(height: 10.h),
                        if (isAdvanceSearchActive)
                          InputText(
                              label: 'Ingredients',
                              hint: 'egg, milk, butter, etc',
                              onChanged: (value) {
                                context.read<SearchBloc>().add(
                                    SearchEventOnChangeIngredients(
                                        ingredients: value ?? ''));
                              }),
                        if (isAdvanceSearchActive) SizedBox(height: 10.h),
                        if (isAdvanceSearchActive)
                          SizedBox(
                            height: 40.h,
                            child: RoundedRectangleButton(
                              text: '',
                              onTap: () {
                                context.read<SearchBloc>().add(
                                    const SearchEventSearch(
                                        listData: dummyMeals));
                              },
                              titleButton: isLoading
                                  ? CircularProgressIndicator(
                                      color: appColor.primaryColor,
                                    )
                                  : Text(
                                      'Search',
                                      style: Textstyles.m
                                          .copyWith(color: Colors.white),
                                    ),
                            ),
                          ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<SearchBloc>()
                                .add(ChangeAdvanceSearchActive());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 15.h,
                            decoration: BoxDecoration(
                              color: appColor.secondaryButtonColor,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: isAdvanceSearchActive
                                ? Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 20.w,
                                    color: appColor.textColor,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 20.w,
                                    color: appColor.textColor,
                                  ),
                          ),
                        ),
                        SizedBox(height: 10.h)
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
