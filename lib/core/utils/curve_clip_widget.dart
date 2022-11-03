import 'package:flutter/material.dart';

class CurveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * 0.32);
    path.quadraticBezierTo(size.width * 1.08, size.height * 0.14,
        size.width * 0.90, size.height * 0.14);
    path.cubicTo(size.width * 0.5, size.height * 0.16, size.width * 0.9,
        size.height * 0.0, size.width * 0.55, size.height * 0.002);
    path.quadraticBezierTo(
        size.width * 0.6304750, size.height * -0.0042400, 0, 0);

    // canvas.drawPath(path, path);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
