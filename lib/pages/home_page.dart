import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:bloc_app/pages/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    final counterCubitGlobal = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IncrementDecrementPage(),
                ),
              );
            },
            icon: Icon(Icons.open_in_browser),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, counter) {
                return Column(
                  children: [
                    BlocBuilder(
                      bloc: counterCubit,
                      builder: (context, counter) {
                        return Text(
                          'Current counter value (local): $counter',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        );
                      },
                    ),
                    BlocBuilder(
                      bloc: counterCubitGlobal,
                      builder: (context, counterGlobal) {
                        return Text(
                          'Global counter value (local): $counterGlobal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubit.increment();
              counterCubitGlobal.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10.0),
          FloatingActionButton(
            onPressed: () {
              counterCubit.decrement();
              counterCubitGlobal.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
