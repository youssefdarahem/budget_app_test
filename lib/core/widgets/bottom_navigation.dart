import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: size.height * 0.66,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(100, 250, 250, 250),
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
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/Icon awesome-user-alt.svg'),
            ),
            IconButton(
                onPressed: () {},
                icon:
                    SvgPicture.asset('assets/images/Icon awesome-car-alt.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/images/Icon awesome-store.svg')),
            IconButton(
                onPressed: () {},
                icon:
                    SvgPicture.asset('assets/images/Icon ionic-md-wallet.svg')),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                    'assets/images/Icon material-restaurant-menu.svg')),
          ],
        ),
      ),
    );
  }
}
