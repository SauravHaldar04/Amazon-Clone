import 'package:amazon_clone/common/widgets/appbuton.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(child: AppButton(text: 'Your Orders', onTap: () {})),
          Expanded(child: AppButton(text: 'Turn Sellers', onTap: () {})),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(child: AppButton(text: 'Log Out', onTap: () {})),
          Expanded(child: AppButton(text: 'Your Wishlist', onTap: () {})),
        ],
      )
    ]);
  }
}
