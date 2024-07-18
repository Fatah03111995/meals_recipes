import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/data/models/meals_model.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_event.dart';
import 'package:meals_recipes/ui/pages/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchEventOnChangeTitle>(_onChangeTitle);
    on<SearchEventOnChangeIngredients>(_onChangeIngredients);
    on<SearchEventSearch>(_onSearch);
    on<ChangeAdvanceSearchActive>(_onChangeIsAdvanceSearchActive);
  }

  void _onChangeTitle(SearchEventOnChangeTitle event, Emitter emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onChangeIngredients(
      SearchEventOnChangeIngredients event, Emitter emit) {
    emit(state.copyWith(listSearchIngredients: event.listSearchIngredients));
  }

  void _onSearch(SearchEventSearch event, Emitter emit) {
    List<Meal> listMeals = event.listData;
    List<Meal> filteredData = listMeals;
    if (state.title.isNotEmpty) {
      filteredData = listMeals
          .where((meal) => meal.title
              .toLowerCase()
              .contains(state.title.toLowerCase().trim()))
          .toList();
    }

    if (state.listSearchIngredients.isNotEmpty) {
      print('MENCARI ${state.listSearchIngredients}');
      filteredData = listMeals.where((meal) {
        List<String> ingredientsToLowerCase =
            meal.ingredients.map((item) => item.toLowerCase()).toList();
        return state.listSearchIngredients
            .every((itemSearch) => ingredientsToLowerCase.contains(itemSearch));
      }).toList();
      print(filteredData);
    }

    emit(state.copyWith(filteredData: filteredData));
  }

  void _onChangeIsAdvanceSearchActive(
      ChangeAdvanceSearchActive event, Emitter emit) {
    emit(state.copyWith(isAdvanceSearchActive: !state.isAdvanceSearchActive));
  }
}
