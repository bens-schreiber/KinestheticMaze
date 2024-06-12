import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';

class Gyroscope extends StatelessWidget {
  const Gyroscope({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: directionVectorStream,
      builder: (context, snapshot) {
        Vector2 vector = snapshot.data?.clone() ?? directionVectorCache.clone();
        vector.scale(200);
        return CustomPaint(
          painter: VectorPainter(vector),
          child: Container(),
        );
      },
    );
  }
}

class VectorPainter extends CustomPainter {
  final Vector2 vector;

  VectorPainter(this.vector);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(size.width / 2, size.height / 2)
      ..lineTo(size.width / 2 + vector.x, size.height / 2 + vector.y);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
