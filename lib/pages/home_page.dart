import 'package:bloc_app/Bloc/counter_bloc.dart';
import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:bloc_app/pages/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Pa1ge'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("Button pressed");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const IncDecPage()),
              );
            },
            icon: const Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, count_cubit) {
                return Text('CounterCubit: $count_cubit');
              },
            ),
            BlocBuilder<CounterBloc, int>(
              bloc: counterBloc,
              builder: (context, count_bloc) {
                return Text('CounterBloc: $count_bloc');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'inc_add',
            onPressed: () {
              counterBloc.add(IncrementCounterBloc());
              counterCubit.increment();
            },
            child: (Icon(Icons.add)),
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            heroTag: 'inc_remove',
            onPressed: () {
              counterCubit.decrement();
              counterBloc.add(DecrementCounterBloc());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
