import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: contentColor,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () {},
              icon: Image.asset(
                "assets/images/icon.png",
                height: 20,
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: contentColor,
                padding: const EdgeInsets.all(14),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
