import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 2.1 * 0.4653591, size.height * 2.1 * 0.06594633);
    path_0.cubicTo(
        size.width * 2.1 * 0.4634623,
        size.height * 2.1 * 0.06478885,
        size.width * 2.1 * 0.4571180,
        size.height * 2.1 * 0.06114595,
        size.width * 2.1 * 0.4442342,
        size.height * 2.1 * 0.05856161);
    path_0.cubicTo(
        size.width * 2.1 * 0.4233678,
        size.height * 2.1 * 0.05438469,
        size.width * 2.1 * 0.4151545,
        size.height * 2.1 * 0.05898251,
        size.width * 2.1 * 0.3803122,
        size.height * 2.1 * 0.05645710);
    path_0.cubicTo(
        size.width * 2.1 * 0.3722686,
        size.height * 2.1 * 0.05587100,
        size.width * 2.1 * 0.3612361,
        size.height * 2.1 * 0.05481927,
        size.width * 2.1 * 0.3512958,
        size.height * 2.1 * 0.05093277);
    path_0.arcToPoint(
        Offset(size.width * 2.1 * 0.3417505, size.height * 2.1 * 0.04599717),
        radius: Radius.elliptical(
            size.width * 2.1 * 0.05122351, size.height * 2.1 * 0.02428128),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(
        Offset(size.width * 2.1 * 0.3338591, size.height * 2.1 * 0.03602023),
        radius: Radius.elliptical(
            size.width * 2.1 * 0.06362788, size.height * 2.1 * 0.03016128),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.cubicTo(
        size.width * 2.1 * 0.3308235,
        size.height * 2.1 * 0.02794418,
        size.width * 2.1 * 0.3352709,
        size.height * 2.1 * 0.02625373,
        size.width * 2.1 * 0.3327492,
        size.height * 2.1 * 0.02039426);
    path_0.cubicTo(
        size.width * 2.1 * 0.3303517,
        size.height * 2.1 * 0.01481731,
        size.width * 2.1 * 0.3236479,
        size.height * 2.1 * 0.01062776,
        size.width * 2.1 * 0.3186966,
        size.height * 2.1 * 0.008178643);
    path_0.cubicTo(
        size.width * 2.1 * 0.3032488,
        size.height * 2.1 * 0.0005035035,
        size.width * 2.1 * 0.2830040,
        size.height * 2.1 * 0.00004524692,
        size.width * 2.1 * 0.2778108,
        0);
    path_0.lineTo(size.width * 2.1 * 0.05501386, 0);
    path_0.arcToPoint(
        Offset(size.width * 2.1 * 0.01669417, size.height * 2.1 * 0.008023436),
        radius: Radius.elliptical(
            size.width * 2.1 * 0.05689294, size.height * 2.1 * 0.02696874),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(0, size.height * 2.1 * 0.02490474),
        radius: Radius.elliptical(
            size.width * 2.1 * 0.06129262, size.height * 2.1 * 0.02905431),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(0, size.height * 2.1 * 0.7290446);
    path_0.lineTo(size.width * 2.1 * 0.4750120, size.height * 2.1 * 0.7290446);
    path_0.lineTo(size.width * 2.1 * 0.4750120, size.height * 2.1 * 0.07630629);
    path_0.arcToPoint(
        Offset(size.width * 2.1 * 0.4653558, size.height * 2.1 * 0.06594633),
        radius: Radius.elliptical(
            size.width * 2.1 * 0.05165416, size.height * 2.1 * 0.02448542),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(0.8);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
