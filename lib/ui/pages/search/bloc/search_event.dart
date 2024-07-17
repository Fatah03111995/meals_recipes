// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:meals_recipes/core/data/models/meals_model.dart';

abstract class SearchEvent {
  const SearchEvent();
}

class SearchEventOnChangeTitle extends SearchEvent {
  final String title;
  const SearchEventOnChangeTitle({required this.title});
}

class SearchEventOnChangeIngredients extends SearchEvent {
  final String ingredients;
  List<String> listSearchIngredients;

  SearchEventOnChangeIngredients({
    required this.ingredients,
    this.listSearchIngredients = const [],
  }) {
    String ingredientsDeleteSpace = '';
    for (int i = 0; i < ingredients.length; i++) {
      if (ingredients[i] != ' ') {
        ingredientsDeleteSpace += ingredients[i];
      }
    }

    listSearchIngredients = ingredientsDeleteSpace.split(',');
  }
}

class SearchEventSearch extends SearchEvent {
  final List<Meal> listData;
  const SearchEventSearch({
    required this.listData,
  });
}

class ChangeAdvanceSearchActive extends SearchEvent {}
