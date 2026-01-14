import 'package:flutter/material.dart';
import 'package:mini_ecommerce/models/profile_model.dart';

final navigationItems = [
  MenuItemModel(
    title: "Notifications",
    icon: Icons.notifications,
    color: Colors.orange,
    onTap: () {},
  ),
  MenuItemModel(
    title: "Messages",
    icon: Icons.message,
    color: Colors.blue,
    onTap: () {},
  ),
  MenuItemModel(
    title: "Partage",
    icon: Icons.share_outlined,
    color: Colors.pink,
    onTap: () {},
  ),
];

final settingsItems = [
  MenuItemModel(
    title: "Security",
    icon: Icons.security,
    color: Colors.green,
    onTap: () {},
  ),
  MenuItemModel(
    title: "Logout",
    icon: Icons.logout,
    color: Colors.red,
    onTap: () {},
  ),
];
