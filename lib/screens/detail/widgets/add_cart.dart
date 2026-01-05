import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class AddCart extends StatefulWidget {
  final Product product;
  const AddCart({super.key, required this.product});

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  int quantity = 1;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 70,
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// QUANTITY
            _quantitySelector(),

            /// ADD TO CART WITH SCALE ANIMATION
            GestureDetector(
              onTapDown: (_) => setState(() => scale = 0.95),
              onTapUp: (_) => setState(() => scale = 1.0),
              onTapCancel: () => setState(() => scale = 1.0),
              onTap: () {
                cartProvider.addToCart(
                  widget.product,
                  quantity: quantity,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Successfully added!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: AnimatedScale(
                scale: scale,
                duration: const Duration(milliseconds: 120),
                curve: Curves.easeOut,
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// EXTRACTION DE LA QUANTITÉ SELON LE CHOIX
  Widget _quantitySelector() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        children: [
          IconButton(
            iconSize: 18,
            onPressed: () {
              if (quantity > 1) {
                setState(() => quantity--);
              }
            },
            icon: const Icon(Icons.remove, color: Colors.white),
          ),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          IconButton(
            iconSize: 18,
            onPressed: () => setState(() => quantity++),
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
