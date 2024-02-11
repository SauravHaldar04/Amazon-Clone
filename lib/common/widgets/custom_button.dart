import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? foregroundColor;
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.backgroundColor,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? GlobalVariables.secondaryColor,
          foregroundColor: foregroundColor ?? Colors.white,
          minimumSize: const Size(double.infinity, 50)),
    );
  }
}
