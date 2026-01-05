import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/provider/favorite_provider.dart';
import 'package:mini_ecommerce/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Product product;

  const DetailAppBar({
    super.key,
    required this.product,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final isFavorite = favoriteProvider.isFavorite(product);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          /// BACK
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),

          const Spacer(),

          /// CART
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {
              Navigator.pop(context);
              context.read<NavigationProvider>().changeIndex(3);
            },
            icon: const Icon(Icons.add_shopping_cart),
          ),

          const SizedBox(width: 10),

          /// FAVORITE (ANIMATED)
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {
              favoriteProvider.toggleFavorite(product);
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                key: ValueKey(isFavorite), // indispensable
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
