import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/services/admin_services.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product>? products;
  AdminServices adminServices = AdminServices();

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Center(
            child: Loader(),
          )
        : Scaffold(
            floatingActionButton: FloatingActionButton(
                tooltip: 'Add Products',
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.pushNamed(context, AddProductsScreen.routeName);
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: const Center(
              child: Text('Products'),
            ),
          );
  }
}
