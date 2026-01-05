import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_ecommerce/navbar_screen.dart';
import 'package:mini_ecommerce/provider/cart_provider.dart';
import 'package:mini_ecommerce/provider/favorite_provider.dart';
import 'package:mini_ecommerce/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider(),), // Navigation globale (BottomNav index)
        ChangeNotifierProvider(create: (_) => CartProvider(),), //  Panier
        ChangeNotifierProvider(create: (_) => FavoriteProvider()), // Favoris
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini E-Commerce',
        theme: ThemeData(
          textTheme: GoogleFonts.mulishTextTheme(),
          useMaterial3: true,
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}
