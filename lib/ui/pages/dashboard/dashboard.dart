import 'package:flutter/material.dart';
import 'package:meals_recipes/ui/pages/dashboard/widgets/dashboard_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Text('DASHBOARD'),
        ),
        bottomNavigationBar: DashboardNavBar());
  }
}
