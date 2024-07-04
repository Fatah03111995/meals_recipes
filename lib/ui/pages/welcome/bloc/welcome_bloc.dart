import 'package:bloc/bloc.dart';
import 'package:meals_recipes/ui/pages/welcome/bloc/welcome_event.dart';
import 'package:meals_recipes/ui/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState(0)) {
    on<ChangeIndex>(
      (event, emit) {
        emit(WelcomeState(event.index));
      },
    );
  }

  // if you used cubit, close function has to be called manually
}
