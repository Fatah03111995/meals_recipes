import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/core/bloc/detail_recipy/detail_recipy_event.dart';
import 'package:meals_recipes/core/bloc/detail_recipy/detail_recipy_state.dart';

class DetailRecipyBloc extends Bloc<DetailRecipyEvent, DetailRecipyState> {
  DetailRecipyBloc() : super(const DetailRecipyState()) {
    on<DetailRecipyEventPushData>(_onDetailRecipyEventPushData);
  }

  void _onDetailRecipyEventPushData(
      DetailRecipyEventPushData event, Emitter emit) {
    emit(DetailRecipyState(data: event.data));
  }
}
