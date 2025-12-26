import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,

      // Icône de gauche (retour)
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),

      title: const Text("Détails"),

      // Icônes à droite
      actions: [
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: contentColor,
            padding: const EdgeInsets.all(20),
          ),
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // action favori
          },
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: contentColor,
            padding: const EdgeInsets.all(20),
          ),
          icon: const Icon(Icons.share),
          onPressed: () {
            // action partage
          },
        ),
      ],
    );
  }
}
