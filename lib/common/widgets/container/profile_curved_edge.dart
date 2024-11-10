import 'package:flutter/material.dart';

class CustomProfileCurvedEdge extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w =size.width;
    double h = size.height;
    var path = Path();

    path.lineTo(0, h-40);
    final firstStartingCurve = Offset(0, h);
    final firstEndingCurve = Offset(50, h);
    path.quadraticBezierTo(firstStartingCurve.dx, firstStartingCurve.dy, firstEndingCurve.dx, firstEndingCurve.dy);

    final secondStartingCurve = Offset(50, h);
    final secondEndingCurve = Offset(w-50, h);
    path.quadraticBezierTo(secondStartingCurve.dx, secondStartingCurve.dy, secondEndingCurve.dx, secondEndingCurve.dy);

    final thirdStartingCurve = Offset(w, h);
    final thirdEndingCurve = Offset(w, h-40);
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