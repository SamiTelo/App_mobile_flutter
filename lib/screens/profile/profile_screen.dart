import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/data/profile_data.dart';
import 'package:mini_ecommerce/screens/profile/widgets/header_image.dart';
import 'package:mini_ecommerce/screens/profile/widgets/menu_section.dart';
import 'package:mini_ecommerce/screens/profile/widgets/profile_card.dart';
import 'package:mini_ecommerce/screens/profile/widgets/section_title.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            ProfileHeader(),
            SizedBox(height: 30),
            ProfileCard(),
            SizedBox(height: 30),
            SectionTitle(title: "Navigation"),
            SizedBox(height: 10),
            MenuSection(items: navigationItems),
            SizedBox(height: 20),
            SectionTitle(title: "Settings"),
            SizedBox(height: 10),
            MenuSection(items: settingsItems),
          ],
        ),
      ),
    );
  }
}
