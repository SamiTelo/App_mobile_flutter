import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:mini_ecommerce/screens/home/widgets/carrousel.dart';
import 'package:mini_ecommerce/screens/home/widgets/search_bar.dart' ;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // For search bar
              SearchBar(),
              SizedBox(height: 25),
              Carrousel(),

            ],
          ),
        ),
      ),
    );

  }
}
