import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/lib.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        MyTheme appColor = state.modeThemes;
        return Scaffold(
            backgroundColor: appColor.scaffoldBgColor,
            body: Center(
              child: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return AppRoutes.dashboardEntities[state.index].page;
                },
              ),
            ),
            bottomNavigationBar: const DashboardNavBar());
      },
    );
  }
}
