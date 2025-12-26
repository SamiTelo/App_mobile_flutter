import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor:  Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor:  Colors.white,
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
            ),
          ),

        ],
      ),


    );
  }
}
