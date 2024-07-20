// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';

abstract class RecipiesState extends Equatable {
  const RecipiesState();
}

class RecipiesStateInitial extends RecipiesState {
  final List<Meal> listMeal;
  const RecipiesStateInitial({
    this.listMeal = const [],
  });

  @override
  List<Object?> get props => [listMeal];
}

class RecipiesStateLoading extends RecipiesState {
  @override
  List<Object?> get props => [];
}

class RecipiesStateSuccess extends RecipiesState {
  final List<Meal> listMeal;

  const RecipiesStateSuccess({required this.listMeal});

  @override
  List<Object?> get props => [];
}

class RecipiesStatefailed extends RecipiesState {
  @override
  List<Object?> get props => [];
}
