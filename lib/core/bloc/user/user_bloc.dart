import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/user/user.dart';
import 'package:meals_recipes/core/data/repositories/repo_user_connection.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserStateInitial()) {
    on<UserEventSignIn>(_userEventSignInHandler);
    on<UserEventSignUp>(_userEventSignUpHandler);
    on<UserEventSignOut>(_userEventSignOutHandler);
    on<UserEventIntial>(
      (event, emit) {
        emit(UserStateInitial());
      },
    );
  }

  void _userEventSignInHandler(UserEventSignIn event, Emitter emit) async {
    emit(UserStateLoading());
    try {
      final response = await RepoUserConnection.signInByEmail(
          email: event.email, password: event.password);
      emit(UserStateDone(user: response));
    } catch (e) {
      emit(UserStateFailed());
    }
  }

  void _userEventSignUpHandler(UserEventSignUp event, Emitter emit) async {
    emit(UserStateLoading());
    try {
      final response = await RepoUserConnection.signUp(
        userName: event.username,
        email: event.email,
        password: event.password,
        confirmPassword: event.confimrPassword,
      );
      emit(UserStateDone(user: response));
    } catch (e) {
      emit(UserStateFailed());
    }
  }

  void _userEventSignOutHandler(UserEventSignOut event, Emitter emit) async {
    emit(UserStateLoading());
    RepoUserConnection.signOut();
    emit(UserStateInitial());
  }
}
