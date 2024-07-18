// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meals_recipes/core/data/models/meals_model.dart';

class SearchState {
  final String title;
  final List<String> listSearchIngredients;
  final bool isAdvanceSearchActive;
  final bool isLoading;
  final List<Meal> filteredData;

  const SearchState({
    this.isAdvanceSearchActive = false,
    this.isLoading = false,
    this.title = '',
    this.listSearchIngredients = const [],
    this.filteredData = const [],
  });

  SearchState copyWith({
    String? title,
    List<String>? listSearchIngredients,
    bool? isAdvanceSearchActive,
    bool? isLoading,
    List<Meal>? filteredData,
  }) {
    return SearchState(
      title: title ?? this.title,
      listSearchIngredients:
          listSearchIngredients ?? this.listSearchIngredients,
      isAdvanceSearchActive:
          isAdvanceSearchActive ?? this.isAdvanceSearchActive,
      isLoading: isLoading ?? this.isLoading,
      filteredData: filteredData ?? this.filteredData,
    );
  }
}
