import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    //TODO: fix the list, add Icons
    return Positioned.fill(
      top: size.height * 0.66,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 250, 250, 250),
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(60.0, 60.0),
            topRight: Radius.elliptical(60.0, 60.0),
          ),
          // borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(200, 255, 255, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.car_repair,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.wallet,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.food_bank,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
