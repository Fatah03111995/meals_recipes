import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/routes/app_routes.dart';
import 'package:meals_recipes/core/routes/dashboard_entity.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_event.dart';

class DashboardNavBar extends StatelessWidget {
  const DashboardNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<DashboardEntity> dashboardEntity = AppRoutes.dashboardEntities;
    int currentIndex = context.watch<DashboardBloc>().state.index;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: 50.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.w),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 30,
                offset: const Offset(0, 10))
          ]),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            double displayWidth = MediaQuery.of(context).size.width.w;

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
                    width: index == currentIndex
                        ? 0.32 * displayWidth
                        : 0.18 * displayWidth,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? 50.h : 0,
                      width: index == currentIndex ? 0.32 * displayWidth : 0,
                      decoration: BoxDecoration(
                          color: index == currentIndex
                              ? Colors.blueAccent.withOpacity(0.2)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(25.w)),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    width: index == currentIndex
                        ? displayWidth * 0.32
                        : displayWidth * 0.18,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * 0.13
                                  : 0,
                            ),
                            AnimatedOpacity(
                              opacity: index == currentIndex ? 1 : 0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: Text(
                                index == currentIndex
                                    ? dashboardEntity[index].title
                                    : '',
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              width: index == currentIndex
                                  ? displayWidth * 0.03
                                  : 20,
                            ),
                            Icon(
                              dashboardEntity[index].icon,
                              size: displayWidth * 0.076,
                              color: index == currentIndex
                                  ? Colors.blueAccent
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
