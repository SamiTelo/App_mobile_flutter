import 'package:flutter/material.dart' hide SearchBar;
import 'package:mini_ecommerce/data/product_data.dart';
import 'package:mini_ecommerce/screens/home/widgets/category.dart';
import 'package:mini_ecommerce/screens/home/widgets/images_slider.dart';
import 'package:mini_ecommerce/screens/home/widgets/products_card.dart';
import 'package:mini_ecommerce/screens/home/widgets/search_bar.dart' ;
import 'package:mini_ecommerce/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // état local pour le slider
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //-----------------------------------
              // For search bar
              //---------------------------------
              SearchBar(),
              SizedBox(height: 25),
              //------------------------------------
              // For images slider
              //---------------------------------------
              ImagesSlider(
                currentSlider: currentSlider,
                onChange: (index) {
                  setState(() {
                    currentSlider = index;
                  });
                },
              ),
              SizedBox(height: 25),
              //-------------------------------------
              // For category selection
              //-------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Categories", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                  Text("See all",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),),
                ],),
              SizedBox(height: 25),
              Category(),
              SizedBox(height: 25),
              //-------------------------------------
              // For shopping items
              //-------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text("Special for you", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),),
                Text("See all",  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primaryColor),),
              ],),
              SizedBox(height: 25),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.78,crossAxisSpacing: 14, mainAxisSpacing: 14,),
                itemCount: products.length,
                itemBuilder: (context, index) {
                   return ProductsCard(product: products[index]);
                },
              ),

            ],
          ),
        ),
      ),
    );

  }
}
