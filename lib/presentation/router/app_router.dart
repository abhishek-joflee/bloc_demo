import 'package:flutter/material.dart';

import '../Screens/home_screen.dart';
import '../Screens/second_screen.dart';
import '../Screens/third_screen.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(title: 'HomeScreen', color: Colors.blueAccent),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
              title: 'Second Screen', color: Colors.redAccent),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
              title: 'Third Screen', color: Colors.greenAccent),
        );
      default:
        return null;
    }
  }
}
