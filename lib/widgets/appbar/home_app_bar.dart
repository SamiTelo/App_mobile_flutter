import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 100,

      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFF081A2D),
            Color(0xFFFF7A18),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: const Text(
          "Cartify",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // obligatoire avec ShaderMask
          ),
        ),
      ),


      // Icônes à droite
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: const Icon(Icons.share_outlined),
            style: IconButton.styleFrom(
              backgroundColor: contentColor,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {},
          ),
        ),
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
