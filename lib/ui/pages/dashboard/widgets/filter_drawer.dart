import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/filter/filter_bloc.dart';
import 'package:meals_recipes/core/bloc/filter/filter_event.dart';
import 'package:meals_recipes/core/bloc/filter/filter_state.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/bloc/theme/theme_state.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/dashboard/widgets/switch_list_item.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
        return Drawer(
            backgroundColor: appColor.containerColor,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                      color: appColor.scaffoldBgColor.withOpacity(0.5)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.w),
                        margin: EdgeInsets.only(bottom: 10.h),
                        decoration: BoxDecoration(
                            color: appColor.primaryColor,
                            borderRadius: BorderRadius.circular(30.w)),
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                          size: 30.w,
                        ),
                      ),
                      Text(
                        'Filter',
                        style: Textstyles.lBold.copyWith(
                          color: appColor.textColor,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, state) {
                      List<SwitchItemData> listSwitchItemData = [
                        SwitchItemData(
                            title: 'Gluten Free',
                            subtitle: 'Only include gluten free meals',
                            value: state.isGlutenFree,
                            onChanged: (newBool) {
                              context.read<FilterBloc>().add(
                                  FilterEventGlutenFree(isGlutenFree: newBool));
                            }),
                        SwitchItemData(
                          title: 'Lactose Free',
                          subtitle: 'Only include lactose free meals',
                          value: state.isLactoseFree,
                          onChanged: (newBool) => context
                              .read<FilterBloc>()
                              .add(FilterEventLactoseFree(
                                  isLactoseFree: newBool)),
                        ),
                        SwitchItemData(
                          title: 'Vegan',
                          subtitle: 'Only Vegetable',
                          value: state.isVegan,
                          onChanged: (newBool) => context
                              .read<FilterBloc>()
                              .add(FilterEventVegan(isVegan: newBool)),
                        ),
                        SwitchItemData(
                          title: 'Vegetarian',
                          subtitle: 'Only Vegetable, include egg, milk',
                          value: state.isVegetarian,
                          onChanged: (newBool) => context
                              .read<FilterBloc>()
                              .add(
                                  FilterEventVegetarian(isVegetarian: newBool)),
                        ),
                      ];

                      return ListView.builder(
                          itemCount: listSwitchItemData.length,
                          itemBuilder: (context, index) {
                            return SwitchListItem(
                                appColor: appColor,
                                title: listSwitchItemData[index].title,
                                subtitle: listSwitchItemData[index].subtitle,
                                value: listSwitchItemData[index].value,
                                onChanged: listSwitchItemData[index].onChanged);
                          });
                    },
                  ),
                )
              ],
            ));
      },
    );
  }
}
