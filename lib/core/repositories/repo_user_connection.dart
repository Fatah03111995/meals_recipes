import 'package:firebase_auth/firebase_auth.dart';
import 'package:meals_recipes/core/services/user_connection_by_email.dart';
import 'package:meals_recipes/core/utility/util_component.dart';

class RepoUserConnection {
  static Future<User?> signInByEmail({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      UtilComponent.toastErr('Please fill the empty column');
      return null;
    }
    try {
      final UserCredential response =
          await UserConnectionByEmail.signIn(email: email, password: password);

      if (response.user != null) {
        if (response.user!.emailVerified) {
          UtilComponent.toastSuccess(
              'Welcomeback ${response.user?.displayName ?? ''}!');
          return response.user;
        } else {
          response.user!.sendEmailVerification().then((valuse) =>
              UtilComponent.toastWarning(
                  'Check your inbox and Verify your email !'));
          return null;
        }
      }
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          UtilComponent.toastErr('user not found !');
          break;
        default:
          UtilComponent.toastErr('wrong e-mail or password');
      }
    } catch (e) {
      UtilComponent.toastErr('Unknown Error : ${e.toString()}');
    }
    return null;
  }

  static Future<User> signUp(
      {required String userName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      UtilComponent.toastErr('Please fill the empty column');
      throw 'please fill empty column';
    }

    if (password != confirmPassword) {
      UtilComponent.toastErr('wrong confirm password, please re check');
      throw 'wrong confirm password, please re check';
    }

    try {
      final UserCredential response =
          await UserConnectionByEmail.signUp(email: email, password: password);

      if (response.user != null) {
        await response.user!.sendEmailVerification();
        UtilComponent.toastWarning('Check your inbox and verify your email !');
        await response.user!.updateDisplayName(userName);
        return response.user!;
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          UtilComponent.toastErr('email already in use !');
          break;
        case 'weak-password':
          UtilComponent.toastErr('weak-password !');
          break;
        case 'not-valid-email':
          UtilComponent.toastErr('not valid email !');
          break;
        default:
          UtilComponent.toastErr('plese recheck your input');
      }
    } catch (e) {
      UtilComponent.toastErr('Unknown Error : ${e.toString()}');
    }

    throw 'BELUM SELESAI BANG';
  }

  static Future<void> signOut() async {
    await UserConnectionByEmail.signOut();
  }
}
