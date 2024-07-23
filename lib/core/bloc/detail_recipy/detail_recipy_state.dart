import 'package:equatable/equatable.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';

class DetailRecipyState extends Equatable {
  final Meal? data;
  const DetailRecipyState({this.data});
  @override
  List<Object?> get props => [data];
}
