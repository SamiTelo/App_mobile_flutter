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
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 100,

      // Icône de gauche (retour)
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomAppBar()));
        },
      ),

      title: const Text("Category",style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),),

      // Icônes à droite
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: const Icon(Icons.favorite_border),
            style: IconButton.styleFrom(
              backgroundColor: contentColor,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
