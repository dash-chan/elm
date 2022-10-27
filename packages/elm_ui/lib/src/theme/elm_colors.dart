import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

test() {}

class ElmColors {
  static const primary = ElmColor.primary;
}

enum ElmColorType {
  light9,
  light8,
  light7,
  light5,
  light3,
  base,
  dark2,
}

class ElmColor extends ElmColorSwatch<ElmColorType> {
  const ElmColor(super.primary, super.swatch);

  static const _primaryValue = 0xFF409EFF;
  static const primary = ElmColor(
    _primaryValue,
    {
      ElmColorType.light9: Color(0xFFECF5FF),
      ElmColorType.light8: Color(0xFFD9ECFF),
      ElmColorType.light7: Color(0xFFC6E2FF),
      ElmColorType.light5: Color(0xFF9FCEFF),
      ElmColorType.light3: Color(0xFF79BBFF),
      ElmColorType.base: Color(_primaryValue),
      ElmColorType.dark2: Color(0xFF337ECC),
    },
  );

  static const _successValue = 0xFF67C23A;
  static const success = ElmColor(
    _successValue,
    {
      ElmColorType.light9: Color(0xFFF0F9EB),
      ElmColorType.light8: Color(0xFFE1F3D8),
      ElmColorType.light7: Color(0xFFD1EDC4),
      ElmColorType.light5: Color(0xFFB3E09C),
      ElmColorType.light3: Color(0xFF95D475),
      ElmColorType.base: Color(_successValue),
      ElmColorType.dark2: Color(0xFF529B2E),
    },
  );
}

class ElmColorSwatch<T> extends Color {
  const ElmColorSwatch(super.value, this._swatch);

  @protected
  final Map<T, Color> _swatch;

  Map<T, Color> get swatch => _swatch;

  Color operator [](T type) => _swatch[type]!;

  @override
  int get hashCode => Object.hashAll([_swatch, runtimeType, value]);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return super == other &&
        other is ElmColorSwatch<T> &&
        mapEquals<T, Color>(other._swatch, _swatch);
  }
}
