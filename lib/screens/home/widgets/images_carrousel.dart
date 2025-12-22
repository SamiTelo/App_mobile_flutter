import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Carrousel extends StatelessWidget {
  final int currentIndex;
  final Function(int) onPageChanged;
  final double height;

  // Images intégrées directement
  final List<String> _images = [
    "assets/images/food1.jpg",
    "assets/images/food2.jpg",
    "assets/images/food3.jpg",
    "assets/images/food4.jpg",
    "assets/images/food5.jpg",
  ];

   Carrousel({
    super.key,
    required this.currentIndex,
    required this.onPageChanged,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // GFCarousel principal
          GFCarousel(
            autoPlay: true,
            height: 200.0,
            viewportFraction: 0.8,
            aspectRatio: 16 / 9,
            enlargeMainPage: true,
            items: _images.map((assetPath) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                ),
              );
            }).toList(),
            onPageChanged: onPageChanged,
          ),

          // Dots indicateurs,
          Positioned.fill(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: currentIndex == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentIndex == index ? Colors.black : Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
