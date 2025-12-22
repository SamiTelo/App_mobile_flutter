import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_ecommerce/navbar_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini E-Commerce',
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
        useMaterial3: true, // Active Material Design 3
      ),
      home: const BottomNavBar(),
    );
  }
}
