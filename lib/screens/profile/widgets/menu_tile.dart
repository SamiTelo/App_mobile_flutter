import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/profile_model.dart';

class MenuTile extends StatelessWidget {
  final MenuItemModel item;
  const MenuTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: item.onTap,
            style: IconButton.styleFrom(
              backgroundColor: item.color.withAlpha(40),
            ),
            icon: Icon(item.icon, color: item.color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              item.title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
