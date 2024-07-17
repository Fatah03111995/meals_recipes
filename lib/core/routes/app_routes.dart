import 'package:flutter/material.dart';
import 'package:meals_recipes/core/routes/dashboard_entity.dart';
import 'package:meals_recipes/core/routes/page_entity.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/ui/pages/recipies/recipies_page.dart';

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
    const PageEntity(
      path: PathRoute.dashboard,
      routes: Dashboard(),
    )
  ];

  List<PageEntity> _getPageEntity({String? path = ''}) =>
      _allPageEntity.where((el) => el.path == path).toList();

  Route onGenerateRoute(RouteSettings settings) {
    List<PageEntity> pageEntity = _getPageEntity(path: settings.name);
    bool isLogin = Global.globalPreferences.getIsLogin();
    bool isFirstTime = Global.globalPreferences.getIsDeviceFirstOpen();

    if (pageEntity.isNotEmpty) {
      if (settings.name == PathRoute.welcome && !isFirstTime) {
        if (isLogin) {
          // -------------------------HAS LOGGED IN -------------
          return MaterialPageRoute(
              builder: (_) =>
                  _getPageEntity(path: PathRoute.dashboard).first.routes);
        }

        // ----------------------- NOT FIRST TIME INSTALL ----------------
        return MaterialPageRoute(
            builder: (_) =>
                _getPageEntity(path: PathRoute.signIn).first.routes);
      }

      // --------------------------- PUSH NAMED --------------------
      return MaterialPageRoute(builder: (_) => pageEntity.first.routes);
    }

    //------------------------------- DEFAULT ---------------------------
    return MaterialPageRoute(
        builder: (_) => _getPageEntity(path: PathRoute.signIn).first.routes);
  }

  // ----------------------------  DASHBOARD
  static List<DashboardEntity> get dashboardEntities => [
        const DashboardEntity(
          title: 'Home',
          path: PathRoute.home,
          page: HomePage(),
          icon: Icons.home,
        ),
        const DashboardEntity(
          title: 'Search',
          icon: Icons.search,
          path: PathRoute.search,
          page: SearchPage(),
        ),
        const DashboardEntity(
          title: 'yours',
          icon: Icons.receipt,
          path: PathRoute.add,
          page: RecipiesPage(),
        ),
        const DashboardEntity(
          title: 'Love',
          icon: Icons.favorite,
          path: PathRoute.favorites,
          page: FavouritePage(),
        ),
        const DashboardEntity(
          title: 'profile',
          icon: Icons.person,
          path: PathRoute.settings,
          page: ProfilePage(),
        ),
      ];
}
