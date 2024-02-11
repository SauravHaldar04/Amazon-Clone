import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/home/product-details/product_details_screen.dart';
import 'package:amazon_clone/features/home/search/services/search_services.dart';
import 'package:amazon_clone/features/home/search/widget/searched_product.dart';
import 'package:amazon_clone/features/home/widgets/address_bar.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  static const String routeName = 'search-screen';
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchServices searchServices = SearchServices();
  List<Product>? productList;
  @override
  void initState() {
    // TODO: implement initState
    fetchSearchedProducts();
    print(productList);
    super.initState();
  }

  fetchSearchedProducts() async {
    productList =
        await searchServices.fetchSearchedProducts(context, widget.searchQuery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    navigateToSearchScreen(String searchQuery) {
      Navigator.pushNamed(context, SearchScreen.routeName,
          arguments: searchQuery);
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search Amazon.in',
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
        body: productList == null
            ? const Center(
                child: Loader(),
              )
            : productList!.isEmpty
                ? const Center(child: Text('No Matches Found'))
                : Column(
                    children: [
                      const AddressBar(),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: productList!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetailsScreen.routeName,
                                        arguments: productList![index]);
                                  },
                                  child: SearchedProduct(
                                      product: productList![index]),
                                ),
                              );
                            }),
                      )
                    ],
                  ));
  }
}
