import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/theme/theme_cubit.dart';
import 'package:meals_recipes/core/routes/app_routes.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:meals_recipes/ui/pages/dashboard/widgets/dashboard_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    MyTheme appColor =
        context.watch<ThemeCubit>().state.modeThemes ?? ModeThemes.lightMode;
    int index = context.watch<DashboardBloc>().state.index;
    return Scaffold(
        backgroundColor: appColor.scaffoldBgColor,
        body: Center(
          child: AppRoutes.dashboardEntities[index].page,
        ),
        bottomNavigationBar: const DashboardNavBar());
  }
}
