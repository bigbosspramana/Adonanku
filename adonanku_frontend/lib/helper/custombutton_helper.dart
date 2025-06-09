import 'package:flutter/material.dart';

class ButtonData {
  final String text;
  final Size size;
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderRadius borderRadius;
  final FontWeight fontWeight;
  final double elevation;

  ButtonData({
    required this.text,
    this.size = const Size(200, 65),
    this.backgroundColor = const Color(0xFFCD8636),
    this.foregroundColor = Colors.white,
    this.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(40),
      bottomRight: Radius.circular(40),
    ),
    this.fontWeight = FontWeight.normal,
    this.elevation = 2.0,
  });
}
