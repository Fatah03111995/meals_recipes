import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/routes/app_routes.dart';
import 'package:meals_recipes/core/routes/dashboard_entity.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';
import 'package:meals_recipes/core/themes/textstyles.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_event.dart';

class DashboardNavBar extends StatelessWidget {
  const DashboardNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<DashboardEntity> dashboardEntity = AppRoutes.dashboardEntities;

    int currentIndex = context.watch<DashboardBloc>().state.index;
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.w),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColorLight.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 30,
                offset: const Offset(0, 10))
          ]),
      child: ListView.builder(
          itemCount: dashboardEntity.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                context
                    .read<DashboardBloc>()
                    .add(ChangeIndexDashboard(nextIndex: index));
                HapticFeedback.lightImpact();
              },
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex ? 110.w : 30.w,
                    alignment: Alignment.center,

                    // ---------------------------------- BACKGROUND ICON
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? 50.h : 0,
                      width: index == currentIndex ? 110.w : 30.w,
                      decoration: BoxDecoration(
                          color: index == currentIndex
                              ? MyColors.blue1.withOpacity(0.5)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.w)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? 110.w //  ----------- width to cover icon + text
                        : 50.w, // ------------ width to cover icon
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex ? 40.w : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                  index == currentIndex
                                      ? dashboardEntity[index].title
                                      : '',
                                  style: Textstyles.sBold
                                      .copyWith(color: Colors.black)),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: 10.w,
                            ),
                            Icon(
                              dashboardEntity[index].icon,
                              size: 25.w,
                              color: index == currentIndex
                                  ? Colors.black
                                  : Colors.black26,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
