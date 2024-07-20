import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/lib.dart';

class RecipiesBloc extends Bloc<RecipiesEvent, RecipiesState> {
  RecipiesBloc() : super(const RecipiesStateInitial()) {
    on<RecipiesEventFetch>(_onRecipiesEventGet);
  }

  void _onRecipiesEventGet(RecipiesEventFetch event, Emitter emit) {
    emit(RecipiesStateLoading());
    emit(const RecipiesStateSuccess(listMeal: dummyMeals));
  }

  @override
  void onChange(Change<RecipiesState> change) {
    super.onChange(change);
  }
}
