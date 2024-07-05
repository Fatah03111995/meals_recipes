// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserState {
  const UserState();
}

class UserStateInitial extends UserState {}

class UserStateLoading extends UserState {}

class UserStateDone extends UserState {
  final User? user;
  const UserStateDone({this.user});

  @override
  String toString() => 'UserStateDone(user: $user)';
}
