import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/filter/filter_bloc.dart';
import 'package:meals_recipes/core/bloc/filter/filter_state.dart';
import 'package:meals_recipes/core/bloc/recipies/recipies_bloc.dart';
import 'package:meals_recipes/core/bloc/recipies/recipies_state.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/bloc/theme/theme_state.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/core/bloc/search/search_bloc.dart';
import 'package:meals_recipes/core/bloc/search/search_state.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';
import 'package:meals_recipes/ui/widgets/search_section.dart';

class RecipiesPage extends StatelessWidget {
  const RecipiesPage({super.key});

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

              return Stack(
                children: [
                  BlocSelector<SearchBloc, SearchState, List<Meal>>(
                    selector: (state) {
                      return state.resultSearch;
                    },
                    builder: (context, resultSearch) {
                      List<Meal> resultedData = resultSearch;

                      FilterState filterState =
                          context.watch<FilterBloc>().state;
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
                      return Center(
                          child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: appColor.containerColor.withOpacity(0.5),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Assets.ui.employee3.image(height: 150.h),
                            Text(
                              'Start Write Your Recipy Here..',
                              style: Textstyles.mBold.copyWith(
                                color: appColor.textColor,
                              ),
                            ),
                          ],
                        ),
                      ));
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 150.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(appColor.primaryColor)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              'Add Recipy',
                              style: Textstyles.sBold
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),

                  // ------------------ SEARCH AND FILTER SECTION
                  SearchSection(
                    appColor: appColor,
                    rawMeals: meals,
                    activatedDrawer: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
