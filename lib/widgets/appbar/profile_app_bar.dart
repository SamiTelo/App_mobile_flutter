import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ✅ constructeur const
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: const Text('Profil'),
    );
  }
}
