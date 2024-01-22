import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add Products',
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, AddProductsScreen.routeName);
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Center(
        child: Text('Products'),
      ),
    );
  }
}
