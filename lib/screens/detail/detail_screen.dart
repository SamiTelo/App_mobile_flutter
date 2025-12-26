import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/screens/detail/widgets/description.dart';
import 'package:mini_ecommerce/screens/detail/widgets/detail_app_bar.dart';
import 'package:mini_ecommerce/screens/detail/widgets/image_slider_detail.dart';
import 'package:mini_ecommerce/screens/detail/widgets/items_detail.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key,required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColors = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      // for add to cart, icon and quantity
      body: SafeArea(
          child: SingleChildScrollView(
           child: Padding(
               padding: EdgeInsets.only(bottom: 40),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 // -------------------------------------------
                 // For back button share and favorite
                 // -------------------------------------------
                 DetailAppBar(),
                 // --------------------------------------
                 // For detail image slider
                 // -----------------------------------------
                 ImageSliderDetail(image: widget.product.image, onChange: (index){
                   setState(() {
                     currentImage = index;
                   });
                 }),
                 SizedBox(height: 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: List.generate(
                     5,
                         (index) => AnimatedContainer(
                       duration: const Duration(milliseconds: 300),
                       width: currentImage == index ? 15 : 8,
                       height: 8,
                       margin: const EdgeInsets.only(right: 3),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: currentImage == index ? primaryColor : Colors.transparent,
                         border: Border.all(color: Colors.black54),
                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 20),
                 // --------------------------------------
                 // For container items details
                 // -----------------------------------------
                 Container(
                   width: double.infinity,
                   decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(
                         topLeft: Radius.circular(40),
                         topRight: Radius.circular(40),
                       )),
                   padding: EdgeInsets.only(
                     top: 20, right: 20, left: 20,bottom: 80,
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       // For product name, pricing, rating and seller
                       ItemsDetail(product: widget.product),
                       SizedBox(height: 20),
                       Text("Colors", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                       SizedBox(height: 20),
                       // For product colors
                       Row(
                         children: List.generate(
                           widget.product.colors.length,
                               (index) => GestureDetector(
                             onTap: (){
                               setState(() {
                                 currentColors = index;
                               });
                             },
                             child: AnimatedContainer(
                               duration: Duration(milliseconds: 300),
                               width: 40,
                               height: 40,
                               decoration: BoxDecoration(
                                   shape:  BoxShape.circle,
                                   color: currentColors == index? Colors.white : widget.product.colors[index] ,
                                   border: currentColors == index? Border.all(color: widget.product.colors[index],) : null
                               ),
                               padding: currentColors == index? const EdgeInsets.all(2) : null,
                               margin: EdgeInsets.only(right: 10 ),
                               child: Container(
                                 width: 35,
                                 height: 35,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: widget.product.colors[index],
                                 ),
                               ),
                             ),
                           ),
                         ) ,
                       ),
                       SizedBox(height: 30),
                       // For product description
                       Description(description: widget.product.description),
                     ],
                   ),
                 )
               ],
             ),
           ),
          ),
      ),
    );
  }
}
