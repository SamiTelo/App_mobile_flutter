import 'package:flutter/material.dart';
import 'package:mini_ecommerce/data/category_data.dart';
import 'package:mini_ecommerce/models/category_model.dart';
import 'package:mini_ecommerce/screens/category/widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 16, right: 16 ),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final CategoryModel category = categories[index];
            return CategoryCard(category: category);
          },
        ),
      ),
    );
  }
}
