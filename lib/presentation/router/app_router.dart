import 'package:bloc_app/presentation/screens/homescreen.dart';
import 'package:bloc_app/presentation/screens/secondscreen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => HomeScreen(title: "First"));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (context) => SecondScreen(title: "Second"));
        break;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Text("Route ${routeSettings.name} not defined"),
                ));
    }
  }
}
