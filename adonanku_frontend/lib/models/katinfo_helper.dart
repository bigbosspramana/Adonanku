import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class KatInfoHelper {
  final String label;
  final String iconKat;
  final int angka;
  final Color warnabg;
  final double marright;

  KatInfoHelper({
    required this.label,
    required this.iconKat,
    required this.angka,
    required this.warnabg,
    required this.marright,
  });
}

Map<String, IconData> iconMap = {
  'habis': FontAwesomeIcons.xmark,
  'menipis': FontAwesomeIcons.info,
  'akankadaluarsa' : FontAwesomeIcons.hourglassHalf,
  'kadaluaras' : FontAwesomeIcons.ban
};