import 'package:amazon_clone/common/widgets/singleproduct.dart';
import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/admin/screens/add_products_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_screen.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
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
  void didUpdateWidget(covariant ProductsScreen oldWidget) {
    // TODO: implement didUpdateWidget
    fetchAllProducts();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  void fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    print(products);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
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
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                final productData = products![index];
                return Column(
                  children: [
                    SizedBox(
                      height: newMethod,
                      child: SingleProduct(image: productData.images[0]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              productData.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          IconButton(
                              onPressed: () =>
                                  deleteProduct(productData, index),
                              icon: const Icon(Icons.delete_outline))
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          );
  }

  double get newMethod => 140;
}
