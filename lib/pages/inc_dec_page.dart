import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementPage extends StatelessWidget {
  const IncrementDecrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubitGlobal = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'), centerTitle: true),
      body: Text('data'),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubitGlobal.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            onPressed: () {
              counterCubitGlobal.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
