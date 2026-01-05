import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_ecommerce/data/screen_data.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/provider/navigation_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: false, //  emperche le déplacement du FAB
      appBar: screensData[nav.currentIndex].appBar, // APPBAR : sélectionnée dynamiquement depuis screensData
      body: screensData[nav.currentIndex].screen, //  BODY : screen correspondant à l'index courant

      // --------------------------------------------------------
      // FLOATING ACTION BUTTON → Ramène toujours à l'écran Home (index 2)
      // --------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () => nav.changeIndex(2),
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        child: const Icon(Icons.home, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // --------------------------------------------------------
      // BOTTOM NAV BAR
      // --------------------------------------------------------
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navButton(context, icon: Icons.grid_view_outlined, index: 0),
            _navButton(context, icon: Icons.favorite_border, index: 1),
            const SizedBox(width: 25), // espace FAB
            _navButton(context, icon: Icons.shopping_cart_outlined, index: 3),
            _navButton(context, icon: Icons.person, index: 4),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------------
  // BOUTON NAVIGATION (DRY + Provider)
  // --------------------------------------------------------
  Widget _navButton(
      BuildContext context, {
        required IconData icon,
        required int index,
      }) {
    final nav = context.watch<NavigationProvider>();

    return IconButton(
      onPressed: () => nav.changeIndex(index),
      icon: Icon(
        icon,
        size: 26,
        color: nav.currentIndex == index
            ? primaryColor
            : Colors.grey.shade400,
      ),
    );
  }
}
