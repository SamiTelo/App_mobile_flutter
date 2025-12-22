import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double rate;
  final int review;
  final String seller;
  final String category;
  final List<Color> colors;
  int quantity;

   Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rate,
    required this.review,
    required this.quantity,
    required this.seller,
    required this.category,
    required this.colors,
  });
}
