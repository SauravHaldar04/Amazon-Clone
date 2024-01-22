import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/home_screen.dart';
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
    case BottomBar.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const BottomBar(),
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
