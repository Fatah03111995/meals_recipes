// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meals_recipes/core/data/models/meals_model.dart';

class SearchState {
  final String title;
  final List<String> listSearchIngredients;
  final bool isInitial;
  final bool isAdvanceSearchActive;
  final bool isLoading;
  final List<Meal> resultSearch;

  const SearchState({
    this.isInitial = true,
    this.isAdvanceSearchActive = false,
    this.isLoading = false,
    this.title = '',
    this.listSearchIngredients = const [],
    this.resultSearch = const [],
  });

  SearchState copyWith({
    String? title,
    List<String>? listSearchIngredients,
    bool? isInitial,
    bool? isAdvanceSearchActive,
    bool? isLoading,
    List<Meal>? resultSearch,
  }) {
    return SearchState(
      title: title ?? this.title,
      listSearchIngredients:
          listSearchIngredients ?? this.listSearchIngredients,
      isInitial: isInitial ?? this.isInitial,
      isAdvanceSearchActive:
          isAdvanceSearchActive ?? this.isAdvanceSearchActive,
      isLoading: isLoading ?? this.isLoading,
      resultSearch: resultSearch ?? this.resultSearch,
    );
  }

  @override
  String toString() {
    return 'SearchState(title: $title, listSearchIngredients: $listSearchIngredients, isInitial: $isInitial, isAdvanceSearchActive: $isAdvanceSearchActive, isLoading: $isLoading, resultSearch: ${resultSearch.length})';
  }
}
