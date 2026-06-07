part of 'counter_bloc.dart';

// Creating an sealed event that is like a parent class for all the events
sealed class CounterEvents {}

// Events
final class IncrementCounterBloc extends CounterEvents {}

final class DecrementCounterBloc extends CounterEvents {}
