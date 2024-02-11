import 'package:amazon_clone/common/widgets/stars.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              product.images[0],
              fit: BoxFit.fitHeight,
              height: 135,
              width: 135,
            ),
          ),
          Column(
            children: [
              Container(
                width: 235,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: const Stars(rating: 4),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  '\$${product.price}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: const Text(
                  'Eligible for FREE delivery',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                width: 235,
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: const Text(
                  'In Stock',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          )
        ]),
      ],
    );
  }
}
