import 'package:bloc_demo/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterText extends StatelessWidget {
  CounterText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      BlocProvider.of<CounterCubit>(context).state.counterValue.toString(),
      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 70.0),
    );
  }
}
