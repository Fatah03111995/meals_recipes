// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignUpState {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  @override
  String toString() {
    return 'SignUpState(username: $username, email: $email, password: $password, confirmPassword: $confirmPassword)';
  }

  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}
