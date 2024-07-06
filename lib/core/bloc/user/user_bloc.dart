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
    emit(UserStateDone(user: response!));
  }

  void _userEventSignUpHandler(UserEventSignUp event, Emitter emit) async {
    emit(UserStateLoading());
    final response = await RepoUserConnection.signUp(
      userName: event.username,
      email: event.email,
      password: event.password,
      confirmPassword: event.confimrPassword,
    );
    emit(UserStateDone(user: response));
  }

  void _userEventSignOutHandler(UserEventSignOut event, Emitter emit) async {
    emit(UserStateLoading());
    RepoUserConnection.signOut();
  }

  @override
  void onChange(Change<UserState> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onEvent(UserEvent event) {
    print(event);
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
