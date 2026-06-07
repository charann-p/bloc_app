import 'package:flutter_bloc/flutter_bloc.dart';

// Creating an event
class IncrementCounterBloc {}

// Implementing Bloc
class CounterBloc extends Bloc<IncrementCounterBloc, int> {
  CounterBloc() : super(0);
}
