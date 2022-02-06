part of 'internet_cubit.dart';

/// there will be 3 states of internet
@immutable
abstract class InternetState {}

// loading state
class InternetLoading extends InternetState {}

// connected state
class InternetConnected extends InternetState {
  final ConnectionType connectionType;
  InternetConnected({
    required this.connectionType,
  });
}

// disconnected state
class InternetDisconnected extends InternetState {}
