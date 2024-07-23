import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/lib.dart';
import 'package:meals_recipes/ui/pages/dashboard/widgets/empty_drawer.dart';
import 'package:meals_recipes/ui/pages/dashboard/widgets/filter_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
        return Scaffold(
            key: scaffoldState,
            backgroundColor: appColor.scaffoldBgColor,
            body: Center(
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return AppRoutes.dashboardEntities[state.index].page;
                },
              ),
            ),
            endDrawer: BlocBuilder<DashboardBloc, DashboardState>(
              builder: (context, state) {
                switch (state.index) {
                  case 1:
                    return const FilterDrawer();
                  case 2:
                    return const FilterDrawer();
                  case 3:
                    return const FilterDrawer();
                  default:
                    return const EmptyDrawer();
                }
              },
            ),
            bottomNavigationBar: const DashboardNavBar());
      },
    );
  }
}
