import 'package:flutter/material.dart';

class KatButtonModel {
  final String label;
  final Widget iconKat;
  final double brbLeft;
  final double brbRight;
  final double brtLeft;
  final double brtRight;
  final Color warnabg;
  final double size;
  final Color warnatxt;
  final double mr;

  KatButtonModel({
    required this.label,
    required this.iconKat,
    required this.brbLeft,
    required this.brbRight,
    required this.brtLeft,
    required this.brtRight,
    required this.warnabg,
    required this.size,
    required this.warnatxt,
    required this.mr,
  });
}