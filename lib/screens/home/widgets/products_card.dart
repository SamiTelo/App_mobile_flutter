import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/models/product_model.dart';

class ProductsCard extends StatelessWidget {
  final Product product;
  const ProductsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
       child: Stack(
         children: [
           Container(
             width: double.infinity,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: contentColor),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 15),
                 Center(
                   child: Container(
                     width: 146,
                     height: 130,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(14),
                       image: DecorationImage(
                         image: AssetImage(product.image),
                         fit: BoxFit.cover,
                       ),
                     ),
                   ),
                 ),
                 SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Text(product.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                 ),
                 SizedBox(height: 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Text("\$${product.price}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17,),),
                     Row(children: List.generate(product.colors.length,(index) => Container(
                       width: 18,
                       height: 18,
                       margin: EdgeInsets.only(right: 4),
                       decoration: BoxDecoration(color: product.colors[index], shape: BoxShape.circle),
                     ),),)
                   ],
                   ),
               ],
             ),
           )
         ],
       ),

    );
  }
}
