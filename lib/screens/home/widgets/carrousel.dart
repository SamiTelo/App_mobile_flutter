import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';

class Carrousel extends StatefulWidget {
  const Carrousel({super.key});

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  // Liste des images
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GFCarousel(
      autoPlay: true,
      height: 200.0,
      viewportFraction: 0.8,
      aspectRatio: 16/9,
      enlargeMainPage: true,
      items: imageList.map(
            (url) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.network(
                url,
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          );
        },
      ).toList(),
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index; // on stocke l'index si besoin
        });
      },
    );
  }
}
