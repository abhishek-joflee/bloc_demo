import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../constants/enums.dart';
import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription<InternetState> internetStreamSubscription;
  CounterCubit({
    required this.internetCubit,
  }) : super(CounterState(counterValue: 0, wasIncremented: false)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription =
        internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.wifi) {
        // CONNECTED TO WIFI
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.mobile) {
        // CONNECTED TO MOBILE DATA
        decrement();
      }
    });
  }

  void increment() => emit(CounterState(
        counterValue: state.counterValue + 1,
        wasIncremented: true,
      ));
  void decrement() => emit(CounterState(
        counterValue: state.counterValue - 1,
        wasIncremented: false,
      ));

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
