import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/lib.dart';
import 'package:meals_recipes/ui/widgets/search_section.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
        return Container(
            margin: const EdgeInsets.only(top: kToolbarHeight),
            alignment: Alignment.topCenter,
            width: 320.w,
            child: BlocBuilder<RecipiesBloc, RecipiesState>(
              builder: (context, state) {
                List<Meal> meals = [];

                if (state is RecipiesStateSuccess) {
                  meals = state.listMeal;
                }

                return Stack(
                  children: [
                    // -------------------------- SEARCH AND FILTER RESULT
                    BlocSelector<SearchBloc, SearchState, List<Meal>>(
                      selector: (state) {
                        return state.filteredData;
                      },
                      builder: (context, filteredData) {
                        List<Meal> filteredMeal = meals;
                        bool isInitialSearch =
                            context.select<SearchBloc, bool>((bloc) {
                          return bloc.state.isInitial;
                        });

                        if (!isInitialSearch) {
                          filteredMeal = filteredData;
                        }
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          margin: EdgeInsets.only(top: kToolbarHeight + 30.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10.w),
                            ),
                          ),
                          child: filteredMeal.isEmpty
                              ? Center(
                                  child: Container(
                                    padding: EdgeInsets.all(10.w),
                                    decoration: BoxDecoration(
                                      color: appColor.containerColor
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Assets.ui.employee4
                                            .image(height: 150.h),
                                        Text(
                                          'Try Search / Search Another One',
                                          style: Textstyles.mBold.copyWith(
                                              color: appColor.textColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  padding: const EdgeInsets.all(0),
                                  itemCount: filteredMeal.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.57,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                  ),
                                  itemBuilder: (context, index) {
                                    return MealCard(
                                      data: filteredMeal[index],
                                    );
                                  }),
                        );
                      },
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
            ));
      },
    );
  }
}
