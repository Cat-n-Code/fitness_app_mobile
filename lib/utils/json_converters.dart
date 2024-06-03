import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  static final colorRegex = RegExp(
    r'^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$',
  );

  @override
  Color fromJson(String value) {
    final match = colorRegex.firstMatch(value);
    if (match == null) {
      throw FormatException('Invalid color format: "$value"');
    }

    final colorCode = match.group(1)!;
    int a = 255, r = 0, g = 0, b = 0;
    switch (colorCode.length) {
      case 3:
        r = int.parse(colorCode[0], radix: 16);
        r = r * 16 + r;
        g = int.parse(colorCode[0], radix: 16);
        g = g * 16 + g;
        b = int.parse(colorCode[0], radix: 16);
        b = b * 16 + b;
      case 6:
        r = int.parse(colorCode.substring(0, 2), radix: 16);
        g = int.parse(colorCode.substring(2, 4), radix: 16);
        b = int.parse(colorCode.substring(4, 6), radix: 16);
      case 8:
        r = int.parse(colorCode.substring(0, 2), radix: 16);
        g = int.parse(colorCode.substring(2, 4), radix: 16);
        b = int.parse(colorCode.substring(4, 6), radix: 16);
        a = int.parse(colorCode.substring(6, 8), radix: 16);
    }

    return Color.fromARGB(a, r, g, b);
  }

  @override
  String toJson(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}
