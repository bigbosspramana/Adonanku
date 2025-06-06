import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/katbutton_helper.dart';

class KategoriButton extends StatelessWidget {
  final KatButtonModel katbutton;
  final VoidCallback onPressed;

  const KategoriButton(
      {required this.katbutton, required this.onPressed, super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(katbutton.brtLeft),
            bottomRight: Radius.circular(katbutton.brbRight),
            bottomLeft: Radius.circular(katbutton.brbLeft),
            topRight: Radius.circular(katbutton.brtRight),
          ),
          border: Border.all(color: const Color(0xFFBABABA)),
        ),
        child: Column(
          children: [
            katbutton.iconKat,
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                katbutton.label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
