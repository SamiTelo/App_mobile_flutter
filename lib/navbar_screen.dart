import 'package:flutter/material.dart';
import 'package:mini_ecommerce/data/screen_data.dart';
import 'package:mini_ecommerce/constants.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // ⚡ emperche le déplacement du FAB
      appBar: screensData[currentIndex].appBar, //  APPBAR : sélectionnée dynamiquement depuis screensData
      body: screensData[currentIndex].screen, //  BODY : screen correspondant à l'index courant
      // ------------------------------------------------------------------------
      //    FLOATING ACTION BUTTON (Ramène toujours à l'écran Home (index 2)
      // -----------------------------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => currentIndex = 2),
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        child: const Icon(Icons.home, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // -----------------------------------------------------------
      // BOTTOM NAVIGATION BAR
      // -----------------------------------------------------------
      bottomNavigationBar: BottomAppBar(
        height: 60,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: contentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navButton(icon: Icons.grid_view_outlined, index: 0),      // Écran 0
            _navButton(icon: Icons.favorite_border, index: 1),          // Écran 1
            const SizedBox(width: 25),                                   // Espace pour FAB
            _navButton(icon: Icons.shopping_cart_outlined, index: 3),   // Écran 3
            _navButton(icon: Icons.person, index: 4),                   // Écran 4
          ],
        ),
      ),
    );
  }
// -----------------------------------------------------------
// WIDGET BOUTON DE NAVIGATION + DRY
// -----------------------------------------------------------
  Widget _navButton({required IconData icon, required int index}) {
    return IconButton(
      onPressed: () => setState(() => currentIndex = index),
      icon: Icon(
        icon,
        size: 26,
        color: currentIndex == index ? primaryColor : Colors.grey.shade400,
      ),
    );
  }
}
