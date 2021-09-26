import 'package:flutter/material.dart';

class Clipper extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.arcToPoint(
      Offset(
        size.width,
        size.height,
      ),
      radius: Radius.elliptical(30.0, 10.0),
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
