import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const TheApp());
}

class TheApp extends StatelessWidget {
  const TheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const HomeScreen(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterEvent>((event, emit) {
      emit(state + 1);
    });
  }
}

abstract class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) => Center(
          child: Text('Cunt: $state'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterBloc>().add(CounterIncrement()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
