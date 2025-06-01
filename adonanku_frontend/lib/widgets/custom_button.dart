import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/custombutton_helper.dart';

class CustomButton extends StatelessWidget {
  final ButtonData buttonData;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonData,
    required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: onPressed, 
          style: ElevatedButton.styleFrom(
            minimumSize: buttonData.size,
            backgroundColor: buttonData.backgroundColor,
            foregroundColor: buttonData.foregroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: buttonData.borderRadius,
            ),
            elevation: buttonData.elevation,
          ),
          child: Text(
            buttonData.text,
            style: TextStyle(fontSize: 20, fontWeight: buttonData.fontWeight),
          ),
        )
      ],
    );
  }
}
