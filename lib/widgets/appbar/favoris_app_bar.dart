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
      backgroundColor: contentColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      // ---------------------------------------
      // title     → contenu central
      //---------------------------------------
      title: const Text(
        "Favorites",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
