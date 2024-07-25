import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/filter/filter_bloc.dart';
import 'package:meals_recipes/core/bloc/filter/filter_state.dart';
import 'package:meals_recipes/lib.dart';
import 'package:meals_recipes/ui/widgets/search_section.dart';

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
                List<Meal> userFavMeal = [
                  ...meals.where((meal) {
                    return userFav.contains(meal.id);
                  })
                ];
                return BlocSelector<SearchBloc, SearchState, List<Meal>>(
                  selector: (state) => state.resultSearch,
                  builder: (context, resultSearch) {
                    List<Meal> resultedData = userFavMeal;
                    bool isInitialSearch =
                        context.select<SearchBloc, bool>((bloc) {
                      return bloc.state.isInitial;
                    });

                    if (!isInitialSearch) {
                      resultedData = resultSearch;
                    }

                    FilterState filterState = context.watch<FilterBloc>().state;
                    resultedData = resultedData.where((meal) {
                      if (filterState.isGlutenFree && !meal.isGlutenFree) {
                        return false;
                      }
                      if (filterState.isLactoseFree && !meal.isLactoseFree) {
                        return false;
                      }
                      if (filterState.isVegan && !meal.isVegan) {
                        return false;
                      }
                      if (filterState.isVegetarian && !meal.isVegetarian) {
                        return false;
                      }
                      return true;
                    }).toList();

                    return Stack(
                      children: [
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(top: kToolbarHeight.h),
                              width: 320.w,
                              child: Builder(builder: (context) {
                                if (state is RecipiesStateLoading) {
                                  return CircularProgressIndicator(
                                      color: appColor.textColor);
                                }

                                if (resultedData.isEmpty) {
                                  return Center(
                                    child: Container(
                                      padding: EdgeInsets.all(20.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.w),
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
                                    itemCount: resultedData.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5,
                                      childAspectRatio: 0.57,
                                    ),
                                    itemBuilder: (context, index) {
                                      return MealCard(
                                          data: resultedData[index]);
                                    });
                              })),
                        ),

                        // ------------------ SEARCH AND FILTER SECTION
                        SearchSection(
                          appColor: appColor,
                          rawMeals: userFavMeal,
                          activatedDrawer: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        )
                      ],
                    );
                  },
                );
              },
            );
          }),
        );
      },
    );
  }
}
