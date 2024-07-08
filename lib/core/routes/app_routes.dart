import 'package:flutter/material.dart';
import 'package:meals_recipes/core/routes/dashboard_entity.dart';
import 'package:meals_recipes/core/routes/page_entity.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:meals_recipes/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  final List<PageEntity> _allPageEntity = [
    const PageEntity(
      path: PathRoute.splash,
      routes: SplashPage(),
    ),
    PageEntity(
      path: PathRoute.welcome,
      routes: BlocProvider(
        create: (context) => WelcomeBloc(),
        child: const WelcomePage(),
      ),
    ),
    PageEntity(
      path: PathRoute.signIn,
      routes: BlocProvider(
        create: (context) => SignInBloc(),
        child: const SignInPage(),
      ),
    ),
    PageEntity(
      path: PathRoute.signUp,
      routes: BlocProvider(
        create: (context) => SignUpBloc(),
        child: const SignUpPage(),
      ),
    ),
    PageEntity(
      path: PathRoute.dashboard,
      routes: BlocProvider(
        create: (context) => DashboardBloc(),
        child: const Dashboard(),
      ),
    )
  ];

  List<PageEntity> _getPageEntity({String? path = ''}) =>
      _allPageEntity.where((el) => el.path == path).toList();

  Route onGenerateRoute(RouteSettings settings) {
    List<PageEntity> pageEntity = _getPageEntity(path: settings.name);

    if (pageEntity.isNotEmpty) {
      return MaterialPageRoute(builder: (_) => pageEntity.first.routes);
    }

    return MaterialPageRoute(
        builder: (_) => _getPageEntity(path: PathRoute.signIn).first.routes);
  }

  // ----------------------------  DASHBOARD
  static List<DashboardEntity> get dashboardEntities => [
        const DashboardEntity(
            title: 'Home',
            path: PathRoute.home,
            page: Home(),
            icon: Icons.home),
        const DashboardEntity(
            title: 'Search',
            icon: Icons.search,
            path: PathRoute.search,
            page: Search()),
        const DashboardEntity(
            title: 'Add',
            icon: Icons.add_circle,
            path: PathRoute.add,
            page: Favourite()),
        const DashboardEntity(
            title: 'Favourite',
            icon: Icons.favorite,
            path: PathRoute.favorites,
            page: Favourite()),
        const DashboardEntity(
            title: 'Settings',
            icon: Icons.settings,
            path: PathRoute.settings,
            page: Settings()),
      ];
}
