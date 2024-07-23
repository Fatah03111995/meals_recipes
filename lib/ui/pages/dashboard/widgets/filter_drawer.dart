import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/bloc/theme/theme_state.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/dashboard/widgets/switch_list_item.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<SwitchItemData> listSwitchItemData = [
      const SwitchItemData(
          title: 'Gluten Free', subtitle: 'Only include gluten free meals'),
      const SwitchItemData(
          title: 'Lactose Free', subtitle: 'Only include lactose free meals'),
      const SwitchItemData(title: 'Vegan', subtitle: 'Only Vegetable'),
      const SwitchItemData(
          title: 'Vegetarian', subtitle: 'Only Vegetable, include egg, milk'),
    ];

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
                  child: ListView.builder(
                      itemCount: listSwitchItemData.length,
                      itemBuilder: (context, index) {
                        return SwitchListItem(
                            appColor: appColor,
                            title: listSwitchItemData[index].title,
                            subtitle: listSwitchItemData[index].subtitle,
                            value: true,
                            onChanged: (newBool) {});
                      }),
                )
              ],
            ));
      },
    );
  }
}
