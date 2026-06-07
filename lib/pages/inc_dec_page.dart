import 'package:bloc_app/Bloc/counter_bloc.dart';
import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'inc_add',
            onPressed: () {
              counterBloc.add(IncrementCounterBloc());
            },
            child: (Icon(Icons.add)),
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            heroTag: 'inc_remove',
            onPressed: () {
              counterBloc.add(DecrementCounterBloc());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Increment Decrement Page'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('data')],
        ),
      ),
    );
  }
}
