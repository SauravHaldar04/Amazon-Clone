import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Stars extends StatelessWidget {
  final double rating;
  const Stars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemBuilder: (context, _) {
        return const Icon(
          Icons.star,
          color: GlobalVariables.secondaryColor,
        );
      },
      direction: Axis.horizontal,
      itemCount: 6,
      itemSize: 15,
      rating: rating,
    );
  }
}
