library elm_icons;

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
part 'src/icons.dart';

class ElmIcon extends StatelessWidget {
  const ElmIcon(
    this.icon, {
    super.key,
    this.width,
    this.height,
  });
  final ElmIcons icon;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      icon.text,
      width: width,
      height: height,
    );
  }
}
