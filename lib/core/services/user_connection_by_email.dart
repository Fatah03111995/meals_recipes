import 'package:firebase_auth/firebase_auth.dart';

class UserConnectionByEmail {
  static Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<dynamic> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  static Future<dynamic> signUp(
      {required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
