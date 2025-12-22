import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: contentColor,
        borderRadius: BorderRadius.circular(30), // coins arrondis
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Rechercher...",
                border: InputBorder.none, // pas de bordure
                isDense: true, // réduit la hauteur
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(onPressed:(){}, icon: Icon(Icons.tune, color: primaryColor,))
        ],
      ),
    );
  }
}
