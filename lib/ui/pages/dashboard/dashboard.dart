import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/routes/app_routes.dart';
import 'package:meals_recipes/core/routes/dashboard_entity.dart';
import 'package:meals_recipes/core/themes/my_colors.dart';
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
    List<DashboardEntity> dashboardEntities = AppRoutes.dashboardEntities;
    int index = context.watch<DashboardBloc>().state.index;
    return Scaffold(
        backgroundColor: MyColors.blue1,
        body: Center(
          child: dashboardEntities[index].page,
        ),
        bottomNavigationBar: const DashboardNavBar());
  }
}
