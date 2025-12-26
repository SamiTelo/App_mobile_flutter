import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),
            Text("Specification", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
            Text("reviews", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
          ],
        ),
        SizedBox(height: 20),
        Text( description,style: TextStyle(fontSize: 16, color: Colors.grey),)
      ],
    );
  }
}