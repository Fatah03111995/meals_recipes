import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/filter/filter_event.dart';
import 'package:meals_recipes/core/bloc/filter/filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<FilterEventGlutenFree>(_onGlutenFree);
    on<FilterEventLactoseFree>(_onLactoseFree);
    on<FilterEventVegan>(_onVegan);
    on<FilterEventVegetarian>(_onVegetarian);
  }

  void _onGlutenFree(FilterEventGlutenFree event, Emitter emit) {
    emit(state.copyWith(isGlutenFree: event.isGlutenFree));
  }

  void _onLactoseFree(FilterEventLactoseFree event, Emitter emit) {
    emit(state.copyWith(isLactoseFree: event.isLactoseFree));
  }

  void _onVegan(FilterEventVegan event, Emitter emit) {
    emit(state.copyWith(isVegan: event.isVegan));
  }

  void _onVegetarian(FilterEventVegetarian event, Emitter emit) {
    emit(state.copyWith(isVegetarian: event.isVegetarian));
  }

  @override
  void onChange(Change<FilterState> change) {
    print(change);
    super.onChange(change);
  }
}
