import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/ui/pages/signin/bloc/sign_in_event.dart';
import 'package:meals_recipes/ui/pages/signin/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_emailHandler);
    on<PasswordEvent>(_passwordHandler);
  }

  void _emailHandler(EmailEvent event, Emitter emit) {
    emit(state.copyWith(email: event.email ?? ''));
  }

  void _passwordHandler(PasswordEvent event, Emitter emit) {
    emit(state.copyWith(password: event.password ?? ''));
  }
}
