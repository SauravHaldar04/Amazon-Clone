import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/category_deals_screen.dart';
import 'package:amazon_clone/features/home/home_screen.dart';
import 'package:amazon_clone/features/home/product-details/product_details_screen.dart';
import 'package:amazon_clone/features/home/search/screens/search_screen.dart';
import 'package:amazon_clone/models/product_model.dart';
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
    case AddProductsScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddProductsScreen(),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CategoryDealsScreen(
          category: category,
        ),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );
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
