class SignUpEvent {
  const SignUpEvent();
}

class SignUpUsernameEvent extends SignUpEvent {
  final String? username;
  const SignUpUsernameEvent(this.username);
}

class SignUpEmailEvent extends SignUpEvent {
  final String? email;
  const SignUpEmailEvent(this.email);
}

class SignUpPasswordEvent extends SignUpEvent {
  final String? password;
  const SignUpPasswordEvent(this.password);
}

class SignUpConfirmPasswordEvent extends SignUpEvent {
  final String? confirmPassword;
  const SignUpConfirmPasswordEvent(this.confirmPassword);
}
