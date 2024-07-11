import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meals_recipes/core/data/global_preferences.dart';
import 'package:meals_recipes/firebase_options.dart';

class Global {
  static late GlobalPreferences globalPreferences;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    globalPreferences = await GlobalPreferences().instance();
  }
}
