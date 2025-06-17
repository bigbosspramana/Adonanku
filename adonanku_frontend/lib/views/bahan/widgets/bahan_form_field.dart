import 'package:flutter/material.dart';

class BahanFormField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final bool readOnly;
  final void Function()? onTap;

  const BahanFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20, color: Colors.black54)
            : null,
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD1D1D1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF1C6758), width: 1.5),
        ),
      ),
      style: const TextStyle(
        fontFamily: 'Radio Canada',
        fontSize: 14,
        color: Colors.black87,
      ),
    );
  }
}
