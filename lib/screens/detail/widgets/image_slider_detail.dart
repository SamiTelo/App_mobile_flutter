import 'package:flutter/material.dart';

class ImageSliderDetail extends StatelessWidget {
  final Function (int) onChange;
  final String image;
  const ImageSliderDetail({super.key, required this.image, required this.onChange,});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:250,
      child: PageView.builder(
          onPageChanged: onChange,
          itemBuilder: (context, index){
            return Image.asset(image);
          }
      ),
    );
  }
}
