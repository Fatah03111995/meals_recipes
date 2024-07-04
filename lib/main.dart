import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/routes/app_routes.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ModeThemes.light,
        onGenerateRoute: AppRoutes().onGenerateRoute,
      ),
    );
  }
}
