import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/global.dart';
import 'package:meals_recipes/lib.dart';

void main() async {
  await Global.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => UserBloc()),
    BlocProvider(create: (_) => ThemeCubit()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    ThemeState themeState = context.watch<ThemeCubit>().state;

    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeState.modeThemes,
        onGenerateRoute: AppRoutes().onGenerateRoute,
      ),
    );
  }
}
