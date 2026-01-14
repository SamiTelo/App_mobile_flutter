import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  // ✅ constructeur const
  const ProfileAppBar({super.key});
  static const double _height = 80;

  @override
  Size get preferredSize => const Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: contentColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: _height,
      centerTitle: true,
      leadingWidth: 72, // augmente l’espace à gauche, largeur réservée suffisante pour padding
      // ---------------------------------------
      // leading   → navigation (retour)
      //---------------------------------------
      leading: Padding(
        padding: const EdgeInsets.only(left: 16), // marge depuis le bord
        child: CircleAvatar(
          backgroundColor: contentColor,
          child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(13),
              ),
              iconSize: 24,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<NavigationProvider>().changeIndex(2);
              }
          ),
        ),
      ),
      // ---------------------------------------
      // title     → contenu central
      //---------------------------------------
      title: const Text(
        "My Profil",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      // ---------------------------------------
      // actions   → actions secondaires
      //---------------------------------------
      actions: [
      ],
    );
  }
}
