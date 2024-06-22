import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
          child: CustomPaint(
            painter: SmileyPainter(),
          ),
        ),
        kWidth,
      ],
    );
  }
}

class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw eyes
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 2, paint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.3), 2, paint);

    // Draw mouth
    final mouthPath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.9,
        size.width * 0.8,
        size.height * 0.6,
      )
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.8,
        size.width * 0.2,
        size.height * 0.7,
      );

    canvas.drawPath(mouthPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
