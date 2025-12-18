import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class FavorisAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ✅ constructeur const
  const FavorisAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Favoris'),
          Icon(Icons.favorite),
        ],
      ),
    );
  }
}
