import 'package:flutter/material.dart';
import 'package:meals_recipes/core/routes/page_entity.dart';
import 'package:meals_recipes/core/routes/path_route.dart';
import 'package:meals_recipes/ui/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/ui/pages/signin/bloc/sign_in_bloc.dart';

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
    const PageEntity(
      path: PathRoute.signUp,
      routes: SignUpPage(),
    ),
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
}
