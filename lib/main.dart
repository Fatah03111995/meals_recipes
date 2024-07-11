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
    BlocProvider(
      create: (_) => ThemeCubit(),
      lazy: false,
    ),
    BlocProvider(create: (_) => DashboardBloc()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    bool isDarkMode = Global.globalPreferences.getIsDarkMode();
    isDarkMode
        ? context.read<ThemeCubit>().emitDarkMode()
        : context.read<ThemeCubit>().emitLightMode();

    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes().onGenerateRoute,
      ),
    );
  }
}
