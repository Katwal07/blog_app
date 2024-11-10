import 'package:flutter/material.dart';

class CustomCurvedEdge extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w =size.width;
    double h = size.height;
    var path = Path();

    path.lineTo(0, h);
    final firstStartingCurve = Offset(0, h-20);
    final firstEndingCurve = Offset(30, h-20);
    path.quadraticBezierTo(firstStartingCurve.dx, firstStartingCurve.dy, firstEndingCurve.dx, firstEndingCurve.dy);

    final secondStartingCurve = Offset(30, h-20);
    final secondEndingCurve = Offset(w-30, h-20);
    path.quadraticBezierTo(secondStartingCurve.dx, secondStartingCurve.dy, secondEndingCurve.dx, secondEndingCurve.dy);

    final thirdStartingCurve = Offset(w, h-20);
    final thirdEndingCurve = Offset(w, h);
    path.quadraticBezierTo(thirdStartingCurve.dx, thirdStartingCurve.dy, thirdEndingCurve.dx, thirdEndingCurve.dy);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}