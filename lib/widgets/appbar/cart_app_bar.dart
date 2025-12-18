import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ✅ constructeur const
  const CartAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: const Text('Panier'),
    );
  }
}
