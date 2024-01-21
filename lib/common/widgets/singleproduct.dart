import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  final String image;
  const SingleProduct({super.key, required this.image});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12, width: 1.5)),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            widget.image,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
