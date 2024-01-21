import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/home/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );
      }
    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      }
    default:
      {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route Not found!")),
          ),
        );
      }
  }
}
