import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/bloc/theme/theme_state.dart';
import 'package:meals_recipes/core/data/dummy.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_bloc.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_event.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_state.dart';
import 'package:meals_recipes/ui/widgets/generated/assets.gen.dart';
import 'package:meals_recipes/ui/widgets/input_text.dart';
import 'package:meals_recipes/ui/widgets/rounded_rectangle_button.dart';

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
          child: Stack(
            children: [
              BlocSelector<SearchBloc, SearchState, List<Meal>>(
                selector: (state) {
                  return state.filteredData;
                },
                builder: (context, filteredData) {
                  List<Meal> meals = filteredData;

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
                          style: Textstyles.sBold.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    onPressed: () {},
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
