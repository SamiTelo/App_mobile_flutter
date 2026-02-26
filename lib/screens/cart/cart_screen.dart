import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/provider/cart_provider.dart';
import 'package:mini_ecommerce/screens/cart/widgets/check_out.dart';
import 'widgets/cart_item_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Écoute les changements du panier
    final cartProvider = context.watch<CartProvider>();
    final cartList = cartProvider.cart;

    return Scaffold(
      backgroundColor: contentColor,

      // BottomSheet affiché uniquement si le panier n’est pas vide
      bottomSheet: cartList.isNotEmpty ? const CheckOutBox() : null,

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: cartList.isEmpty
              // ---------------- EMPTY STATE ----------------
                  ? const Center(
                child: Text(
                  "Votre panier est vide",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )

              // ---------------- CART LIST ----------------
                  : ListView.builder(
                padding: const EdgeInsets.only(
                  bottom: 140, // espace pour le CheckOutBox
                ),
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartList[index];

                  return CartItemCard(
                    cartItem: cartItem,
                    onDelete: () =>
                        cartProvider.removeItem(index),
                    onIncrement: () =>
                        cartProvider.incrementQtn(index),
                    onDecrement: () =>
                        cartProvider.decrementQtn(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
