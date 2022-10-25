import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GridPainter extends CustomPainter {
  /// paint a grid radial gradient
  GridPainter({
    required this.color,
  });
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    for (double x = 0; x < size.width; x += 4) {
      for (double y = 0; y < size.height; y += 4) {
        final p = Paint()
          ..shader = ui.Gradient.radial(
              Offset(x + 2, y + 2), 1, [color.withOpacity(0), color]);
        canvas.drawRect(
          Rect.fromLTRB(x, y, x + 4, y + 4),
          p,
        );
      }
    }
  }

  @override
  bool shouldRepaint(GridPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(GridPainter oldDelegate) => false;
}
