import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/ui/pages/signup/bloc/sign_up_event.dart';
import 'package:meals_recipes/ui/pages/signup/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpUsernameEvent>(_userNameHandler);
    on<SignUpEmailEvent>(_emailHandler);
    on<SignUpPasswordEvent>(_passwordHandler);
    on<SignUpConfirmPasswordEvent>(_confirmPasswordHandler);
  }

  void _userNameHandler(SignUpUsernameEvent event, Emitter emit) {
    emit(state.copyWith(username: event.username ?? ''));
  }

  void _emailHandler(SignUpEmailEvent event, Emitter emit) {
    emit(state.copyWith(email: event.email ?? ''));
  }

  void _passwordHandler(SignUpPasswordEvent event, Emitter emit) {
    emit(state.copyWith(password: event.password ?? ''));
  }

  void _confirmPasswordHandler(SignUpConfirmPasswordEvent event, Emitter emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword ?? ''));
  }
}
