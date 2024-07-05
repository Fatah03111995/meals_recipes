import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_recipes/core/bloc/user/user.dart';
import 'package:meals_recipes/core/routes/app_routes.dart';
import 'package:meals_recipes/core/themes/mode_themes.dart';
import 'package:meals_recipes/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ModeThemes.light,
          onGenerateRoute: AppRoutes().onGenerateRoute,
        ),
      ),
    );
  }
}
