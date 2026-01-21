import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/screens/detail/widgets/add_cart.dart';
import 'package:mini_ecommerce/screens/detail/widgets/description.dart';
import 'package:mini_ecommerce/screens/detail/widgets/detail_app_bar.dart';
import 'package:mini_ecommerce/screens/detail/widgets/image_slider_detail.dart';
import 'package:mini_ecommerce/screens/detail/widgets/items_detail.dart';
import 'package:mini_ecommerce/provider/cart_provider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColors = 0;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: contentColor,

      // FloatingButton pour ajouter au panier
      floatingActionButton: AddCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar avec badge panier
                DetailAppBar(product: widget.product),

                // Slider images produit
                ImageSliderDetail(
                  image: widget.product.image,
                  onChange: (index) {
                    setState(() => currentImage = index);
                  },
                ),
                const SizedBox(height: 10),

                // Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentImage == index ? 15 : 8,
                      height: 8,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: currentImage == index
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Détails produit
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nom, prix, rating
                      ItemsDetail(product: widget.product),
                      const SizedBox(height: 20),

                      // Couleurs
                      const Text("Colors",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22)),
                      const SizedBox(height: 20),
                      Row(
                        children: List.generate(
                          widget.product.colors.length,
                              (index) => GestureDetector(
                            onTap: () => setState(() => currentColors = index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentColors == index
                                    ? Colors.white
                                    : widget.product.colors[index],
                                border: currentColors == index
                                    ? Border.all(
                                    color: widget.product.colors[index])
                                    : null,
                              ),
                              padding:
                              currentColors == index ? const EdgeInsets.all(3) : null,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget.product.colors[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Description
                      Description(description: widget.product.description),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
