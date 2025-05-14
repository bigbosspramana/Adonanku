import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class DataKartu {
  final Map<String, IconData> iconMap = {
      'profile': FontAwesomeIcons.solidUser,
      'pass': FontAwesomeIcons.key,
      'username': FontAwesomeIcons.solidAddressCard,
      'email' : FontAwesomeIcons.solidEnvelope,
      'confirmpass' : FontAwesomeIcons.lock
    };

  final String title;
  final String icon;
  final String placeholder;
  final TextEditingController controller;
  final bool obscureText;

  DataKartu({
    required this.title,
    required this.icon,
    required this.placeholder,
    required this.controller,
    this.obscureText = false,
  });
}