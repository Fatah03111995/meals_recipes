// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meals_recipes/core/data/models/user_model.dart';

abstract class UserState {
  const UserState();
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateFailed extends UserState {}

class UserStateDone extends UserState {
  final UserModel user;
  const UserStateDone({required this.user});

  @override
  String toString() => 'UserStateDone(user: $user)';
}
