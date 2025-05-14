import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/custombutton_model.dart'; // import model baru

class CustomButton extends StatelessWidget {
  final ButtonData buttonData;

  const CustomButton({
    required this.buttonData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
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
