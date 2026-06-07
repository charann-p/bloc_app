import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_events.dart';

// Implementing Bloc
class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    // Event Handlers
    on<IncrementCounterBloc>((event, emit) {
      emit(state + 1);
    });
    on<DecrementCounterBloc>((event, emit) {
      if (state == 0) {
        return;
      }
      emit(state - 1);
    });
  }
}
