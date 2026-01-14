import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/data/profile_data.dart';
import 'package:mini_ecommerce/screens/profile/widgets/Header_image.dart';
import 'package:mini_ecommerce/screens/profile/widgets/Menu_Section.dart';
import 'package:mini_ecommerce/screens/profile/widgets/Profile_Card.dart';
import 'package:mini_ecommerce/screens/profile/widgets/Section_Title.dart';

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
