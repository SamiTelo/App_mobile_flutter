import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final String image;
  final Color color; // 👈 couleur propre à la catégorie

  const CategoryModel({
    required this.title,
    required this.image,
    required this.color,
  });
}
