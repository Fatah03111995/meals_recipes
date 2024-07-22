import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/data/dummy.dart';
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
    List<Meal> filteredData = List.from(event.listData);

    emit(state.copyWith(isLoading: true));

    if (state.title.isNotEmpty) {
      filteredData = [
        ...filteredData.where((meal) =>
            meal.title.toLowerCase().contains(state.title.toLowerCase().trim()))
      ];
    }
    if (state.listSearchIngredients.isNotEmpty) {
      filteredData = [
        ...filteredData.where((meal) {
          List<String> ingredientsToLowerCase =
              meal.ingredients.map((item) => item.toLowerCase()).toList();
          return state.listSearchIngredients.every(
              (itemSearch) => ingredientsToLowerCase.contains(itemSearch));
        })
      ];
    }

    emit(state.copyWith(isLoading: false));
    emit(state.copyWith(
      title: '',
      listSearchIngredients: [],
      isInitial: false,
      filteredData: filteredData,
    ));
  }

  void _onChangeIsAdvanceSearchActive(
      ChangeAdvanceSearchActive event, Emitter emit) {
    emit(state.copyWith(isAdvanceSearchActive: !state.isAdvanceSearchActive));
  }

  @override
  void onChange(Change<SearchState> change) {
    print(change);
    super.onChange(change);
  }
}
