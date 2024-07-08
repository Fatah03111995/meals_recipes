import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_event.dart';
import 'package:meals_recipes/ui/pages/dashboard/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<ChangeIndexDashboard>(_changeIndex);
  }

  void _changeIndex(ChangeIndexDashboard event, Emitter emit) {
    emit(DashboardState(index: event.nextIndex));
  }
}
