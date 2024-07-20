import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/user/user.dart';
import 'package:meals_recipes/core/data/models/user_model.dart';
import 'package:meals_recipes/core/data/repositories/repo_user_connection.dart';
import 'package:meals_recipes/global.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserStateInitial()) {
    on<UserEventSignIn>(_onUserEventSignInHandler);
    on<UserEventSignUp>(_onUserEventSignUpHandler);
    on<UserEventSignOut>(_onUserEventSignOutHandler);
    on<UserEventChangeFavorite>(_onUserEventChangeFavoriteHandler);
  }

  void _onUserEventSignInHandler(UserEventSignIn event, Emitter emit) async {
    emit(UserStateLoading());
    try {
      final response = await RepoUserConnection.signInByEmail(
          email: event.email, password: event.password);

      Global.globalPreferences.setUserToken(response.uid);
      emit(UserStateDone(
          user: UserModel(
        username: response.displayName ?? '',
        email: response.email ?? '',
      )));
    } catch (e) {
      emit(UserStateFailed());
    }
  }

  void _onUserEventSignUpHandler(UserEventSignUp event, Emitter emit) async {
    emit(UserStateLoading());
    try {
      final response = await RepoUserConnection.signUp(
        userName: event.username,
        email: event.email,
        password: event.password,
        confirmPassword: event.confimrPassword,
      );
      emit(UserStateDone(
          user: UserModel(
        username: response.displayName ?? '',
        email: response.email ?? '',
      )));
    } catch (e) {
      emit(UserStateFailed());
    }
  }

  void _onUserEventSignOutHandler(UserEventSignOut event, Emitter emit) {
    emit(UserStateLoading());
    RepoUserConnection.signOut();
    emit(UserStateInitial());
  }

  void _onUserEventChangeFavoriteHandler(
      UserEventChangeFavorite event, Emitter emit) {
    UserState userState = state;

    if (userState is UserStateDone) {
      List<String> userFavorite = List.from(userState.user.favourite);
      if (userFavorite.contains(event.id)) {
        userFavorite.remove(event.id);
      } else {
        userFavorite.add(event.id);
      }

      UserModel updateData = userState.user.copyWith(favourite: userFavorite);

      emit(UserStateDone(
        user: updateData,
      ));
    }
  }

  @override
  void onChange(Change<UserState> change) {
    super.onChange(change);
  }
}
