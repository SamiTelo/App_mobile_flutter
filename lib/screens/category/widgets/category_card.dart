import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.9),
            category.color.withOpacity(0.6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // IMAGE
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // TITLE
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
