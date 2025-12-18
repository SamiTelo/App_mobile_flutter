import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: contentColor,
        borderRadius: BorderRadius.circular(12), // coins arrondis
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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: contentColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.filter_list, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
