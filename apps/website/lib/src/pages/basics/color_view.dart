import 'package:elm_ui/elm_ui.dart';
import 'package:flutter/material.dart';

class ColorView extends StatelessWidget {
  const ColorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(48),
      children: [
        ColorCard(color: ElmColors.primary),
      ],
    );
  }
}

class ColorCard extends StatelessWidget {
  const ColorCard({super.key, required this.color});

  final ElmColor color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 320,
        height: 112,
        child: Material(
          color: color,
          child: Column(
            children: [
              const Expanded(
                child: Center(
                  child: Text('Brand Color'),
                ),
              ),
              SizedBox(
                height: 54,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: color.swatch.values.map((e) {
                    return Expanded(child: Material(color: e));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
