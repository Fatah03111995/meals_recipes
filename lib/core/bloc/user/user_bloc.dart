import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/user/user.dart';
import 'package:meals_recipes/core/repositories/repo_user_connection.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserStateInitial()) {
    on<UserEventSignIn>(_userEventSignInHandler);
    on<UserEventSignUp>(_userEventSignUpHandler);
    on<UserEventSignOut>(_userEventSignOutHandler);
  }

  void _userEventSignInHandler(UserEventSignIn event, Emitter emit) async {
    emit(UserStateLoading());
    final response = await RepoUserConnection.signInByEmail(
        email: event.email, password: event.password);
    emit(UserStateDone(user: response));
  }

  void _userEventSignUpHandler(UserEventSignUp event, Emitter emit) {}
  void _userEventSignOutHandler(UserEventSignOut event, Emitter emit) {}
}
