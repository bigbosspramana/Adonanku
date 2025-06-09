import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  final Color warnaBtn;
  final VoidCallback onPressed;

  const PlusButton({
    super.key,
    required this.onPressed,
    required this.warnaBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: warnaBtn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.add,
          size: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}
