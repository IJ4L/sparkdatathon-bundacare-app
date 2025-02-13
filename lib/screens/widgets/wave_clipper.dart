import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    path.lineTo(0, size.height);

    for (double i = 0; i <= size.width; i++) {
      double y =
          10 * (size.height / 4) * (i / size.width) * (i % 2 == 0 ? 1 : -1);
      path.lineTo(i, size.height + y);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }
 
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
