import 'package:flutter/material.dart';
import 'package:movie_app/utils/k_colors.dart';

class TicketCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lightBlueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(size.width * 0.07, size.height * 0.8);
    path.lineTo(size.width * 0.38, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.25,
        size.width * 0.62, size.height * 0.35);
    path.lineTo(size.width * 0.93, size.height * 0.8);

    canvas.drawPath(path, paint);
    canvas.drawShadow(path, lightBlueColor.withOpacity(0.3), 10, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
