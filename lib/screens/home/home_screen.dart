import 'package:flutter/material.dart' hide SearchBar;
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/data/product_data.dart';
import 'package:mini_ecommerce/provider/navigation_provider.dart';
import 'package:mini_ecommerce/screens/home/widgets/category.dart';
import 'package:mini_ecommerce/screens/home/widgets/images_slider.dart';
import 'package:mini_ecommerce/screens/home/widgets/products_card.dart';
import 'package:mini_ecommerce/screens/home/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;

  //  catégorie sélectionnée
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    // filtrage des produits
    final filteredProducts = selectedCategory == 'All'
        ? products
        : products
        .where((product) => product.category == selectedCategory)
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //---------------- Search Bar ----------------
              const SearchBar(),
              const SizedBox(height: 25),

              //---------------- Slider ----------------
              ImagesSlider(
                currentSlider: currentSlider,
                onChange: (index) {
                  setState(() {
                    currentSlider = index;
                  });
                },
              ),
              const SizedBox(height: 25),

              //---------------- Categories title ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Top Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  InkWell(
                    onTap: () {
                      // On change l'index du BottomNavigationBar pour aller à Categories (index 0)
                      context.read<NavigationProvider>().changeIndex(0);
                    },
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              //---------------- Categories ----------------
              Category(
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              const SizedBox(height: 25),

              //---------------- Products title ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Special for you",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              //---------------- Products Grid ----------------
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductsCard(
                    product: filteredProducts[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
