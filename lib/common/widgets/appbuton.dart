import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AppButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white),
      child: OutlinedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12.withOpacity(0.03),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
