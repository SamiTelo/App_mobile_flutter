import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';
import 'package:mini_ecommerce/models/product_model.dart';

class ItemsDetail extends StatelessWidget {
  final Product product;
  const ItemsDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // for title
        Text(
          product.title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 10),
        // for pricing
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 "\$${product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                // for rating
                Row(
                  children: [
                     Container(
                       height: 23,
                       width: 50,
                       decoration: BoxDecoration(
                         color: primaryColor,
                         borderRadius: BorderRadius.circular(20),
                       ),
                       alignment: Alignment.center,
                       padding: EdgeInsets.symmetric(horizontal: 5),
                       child: Row(
                         children: [
                           Icon(
                               Icons.star,
                               size: 14,
                               color: Colors.white,
                           ),
                           SizedBox(height: 4),
                           Text(
                             product.rate.toString(),
                             style: TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.white,
                               fontSize: 13,
                             ),
                           ),
                         ],
                       ),
                     ),
                    SizedBox(width: 10),
                    Text(
                      "Review : ${product.review}",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text.rich(
             TextSpan(
               children: [
                 TextSpan(
                   text: "seller: ",
                   style: TextStyle(
                     fontSize: 16,
                   ),
                 ),
                 TextSpan(
                   text: product.seller,
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
            ),
          ],
        ),
        //
      ],
    );
  }
}
