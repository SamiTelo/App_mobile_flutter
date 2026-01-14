import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_ecommerce/data/screen_data.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/provider/navigation_provider.dart';
import 'package:mini_ecommerce/provider/cart_provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = context.watch<NavigationProvider>();
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: screensData[nav.currentIndex].appBar,
      body: screensData[nav.currentIndex].screen,

      // FLOATING ACTION BUTTON → Home
      floatingActionButton: FloatingActionButton(
        onPressed: () => nav.changeIndex(2),
        shape: const CircleBorder(),
        backgroundColor: primaryColor,
        child: const Icon(Icons.home, color: Colors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BOTTOM NAV BAR
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
            const SizedBox(width: 25), // espace pour FAB
            // BOUTON PANIER AVEC BADGE
            _navCartButton(context, icon: Icons.shopping_cart_outlined, index: 3, totalItems: cartProvider.totalItems),
            _navButton(context, icon: Icons.person, index: 4),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------------
  // BOUTON NAVIGATION SIMPLE
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

  // --------------------------------------------------------
  // BOUTON PANIER AVEC BADGE
  // --------------------------------------------------------
  Widget _navCartButton(
      BuildContext context, {
        required IconData icon,
        required int index,
        required int totalItems,
      }) {
    final nav = context.watch<NavigationProvider>();

    return Stack(
      children: [
        IconButton(
          onPressed: () => nav.changeIndex(index),
          icon: Icon(
            icon,
            size: 26,
            color: nav.currentIndex == index
                ? primaryColor
                : Colors.grey.shade400,
          ),
        ),
        if (totalItems > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                totalItems.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
