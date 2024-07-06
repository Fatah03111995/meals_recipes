// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class UserEvent {
  const UserEvent();
}

class UserEventSignIn extends UserEvent {
  final String email;
  final String password;
  const UserEventSignIn({
    required this.email,
    required this.password,
  });
}

class UserEventSignUp extends UserEvent {
  final String username;
  final String email;
  final String password;
  final String confimrPassword;
  const UserEventSignUp({
    required this.username,
    required this.email,
    required this.password,
    required this.confimrPassword,
  });

  @override
  String toString() {
    return 'UserEventSignUp(username: $username, email: $email, password: $password, confimrPassword: $confimrPassword)';
  }
}

class UserEventSignOut extends UserEvent {}
