import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          // Hamburger Menu Icon
          Icon(Icons.menu, size: 30, color: Colors.black87),

          // Spacer for centering
          Expanded(
            child: Center(
              // Brand Logo
              child: Image.asset(
                'assets/images/logo.png', // <-- Replace with your logo asset
                width: 38,
                height: 38,
              ),
            ),
          ),

          // Favorite Icon
          Icon(Icons.favorite_border, size: 28, color: Colors.black87),
          const SizedBox(width: 16),
          // Cart/Bag Icon
          Icon(Icons.shopping_bag_outlined, size: 28, color: Colors.black87),
        ],
      ),
    );
  }
}
