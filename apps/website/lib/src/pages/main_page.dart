import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:website/src/pages/widgets/grid_painter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView.builder(
              itemBuilder: (context, index) => const SizedBox(
                height: 100,
                child: Placeholder(),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 56,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: CustomPaint(
                  painter: GridPainter(color: Colors.black),
                  child: Row(),
                ),
              ),
            ),
          ),
          // Positioned.fill(child: child),
        ],
      ),
    );
  }
}
