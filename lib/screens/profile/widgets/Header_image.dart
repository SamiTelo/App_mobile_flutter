import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage("assets/images/slider.png"),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "App Mobile",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Flutter V2.5",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(12),
              ),
              icon: const Icon(Icons.play_arrow, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
