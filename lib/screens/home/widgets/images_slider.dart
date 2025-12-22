import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/constants.dart';

class ImagesSlider extends StatefulWidget {
  final int currentSlider;
  final Function(int) onChange;

  const ImagesSlider({
    super.key,
    required this.currentSlider,
    required this.onChange,
  });

  @override
  State<ImagesSlider> createState() => _ImagesSliderState();
}

class _ImagesSliderState extends State<ImagesSlider> {
  final PageController _controller = PageController();
  late Timer _timer;
  int _currentIndex = 0;

  final List<String> _images = [
    "assets/images/slider.png",
    "assets/images/slider1.jpg",
    "assets/images/slider3.png",
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentSlider;

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_controller.hasClients) {
        int nextPage = _currentIndex + 1;
        if (nextPage >= _images.length) nextPage = 0;
        _controller.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: PageView.builder(
              controller: _controller,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
                widget.onChange(index);
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),

        // Dots indicateurs,
        Positioned.fill(
          bottom: 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _currentIndex == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _currentIndex == index ? primaryColor : Colors.transparent,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
