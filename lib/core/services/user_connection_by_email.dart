import 'package:firebase_auth/firebase_auth.dart';
import 'package:meals_recipes/core/exception/user_exception.dart';

class UserConnectionByEmail {
  static Future<UserCredential> signIn(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      throw UserException(message: 'Please fill all column');
    }
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<dynamic> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  static Future<dynamic> signUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      throw UserException(message: 'please fill empty column');
    }

    if (password != confirmPassword) {
      throw UserException(message: 'wrong confirm password, please re check');
    }

    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
