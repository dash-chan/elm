import 'package:flutter/material.dart';

class ElRawButton extends StatelessWidget {
  const ElRawButton({
    super.key,
    required this.shape,
    required this.color,
  });

  final ShapeBorder shape;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: shape,
      color: color,
    );
  }
}
