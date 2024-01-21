import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          const Text(
            "Hello, ",
            style: TextStyle(fontSize: 22),
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
