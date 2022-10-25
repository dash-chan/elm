import 'package:elm_ui/src/types/default_types.dart';
import 'package:flutter/material.dart';

enum ElButtonType {
  primary,
  success,
  warning,
  danger,
  info,
}

class ElButton extends StatelessWidget {
  const ElButton({
    super.key,
    required this.size,
    this.loading,
    this.icon,
  });

  final ElSize size;

  // --------- extra Widgets --------- //
  final Widget? loading;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
