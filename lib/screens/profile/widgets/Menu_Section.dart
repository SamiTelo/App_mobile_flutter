import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/profile_model.dart';
import 'package:mini_ecommerce/screens/profile/widgets/%20Menu_Tile.dart';

class MenuSection extends StatelessWidget {
  final List<MenuItemModel> items;
  const MenuSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: items.map((item) => MenuTile(item: item)).toList(),
      ),
    );
  }
}
