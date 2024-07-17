import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/lib.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_bloc.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_event.dart';
import 'package:meals_recipes/ui/widgets/meal_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyTheme appColor =
        context.watch<ThemeCubit>().state.modeThemes ?? ModeThemes.lightMode;
    bool isAdvanceSearchActive =
        context.watch<SearchBloc>().state.isAdvanceSearchActive;

    return Container(
        margin: const EdgeInsets.only(top: kToolbarHeight),
        alignment: Alignment.topCenter,
        width: 320.w,
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(
                  top: isAdvanceSearchActive
                      ? kToolbarHeight + 30.h
                      : kToolbarHeight + 30.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.w),
                ),
              ),
              child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return MealCard();
                  }),
            ),
            Container(
              color: appColor.scaffoldBgColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText(
                    label: 'Search',
                    hint: 'title...',
                    onChanged: (value) {},
                    suffixIcon: !isAdvanceSearchActive
                        ? IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: appColor.primaryColor,
                            ))
                        : null,
                  ),
                  if (isAdvanceSearchActive) SizedBox(height: 10.h),
                  if (isAdvanceSearchActive)
                    InputText(
                        label: 'Ingredients',
                        hint: 'egg, milk, butter, etc',
                        onChanged: (value) {}),
                  if (isAdvanceSearchActive) SizedBox(height: 10.h),
                  if (isAdvanceSearchActive)
                    SizedBox(
                      height: 40.h,
                      child: RoundedRectangleButton(
                        text: '',
                        onTap: () {},
                        titleButton: Text(
                          'Search',
                          style: Textstyles.m.copyWith(color: Colors.white),
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
            ),
          ],
        ));
  }
}
