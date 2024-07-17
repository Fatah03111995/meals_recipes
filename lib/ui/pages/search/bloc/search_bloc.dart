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
      filteredData =
          listMeals.where((meal) => meal.title.contains(state.title)).toList();
    }

    if (state.listSearchIngredients.isNotEmpty) {
      filteredData = listMeals.where((meal) {
        return state.listSearchIngredients
            .every((itemSearch) => meal.ingredients.contains(itemSearch));
      }).toList();
    }

    state.copyWith(filteredData: filteredData);
  }

  void _onChangeIsAdvanceSearchActive(
      ChangeAdvanceSearchActive event, Emitter emit) {
    emit(state.copyWith(isAdvanceSearchActive: !state.isAdvanceSearchActive));
  }
}
