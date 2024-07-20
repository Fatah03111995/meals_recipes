// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:meals_recipes/core/data/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserStateInitial extends UserState {
  @override
  List<Object?> get props => [];
}

class UserStateLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserStateFailed extends UserState {
  @override
  List<Object?> get props => [];
}

class UserStateDone extends UserState {
  final UserModel user;
  const UserStateDone({required this.user});
  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'UserStateDone(user: $user)';
}
