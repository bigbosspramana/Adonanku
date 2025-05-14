import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/datacard_model.dart';

class WidgetCard extends StatelessWidget {
  final DataKartu card;

  const WidgetCard({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    final bool hasTitle = card.title.toLowerCase() != 'none';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasTitle)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              card.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3A2216),
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFBABABA)),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Icon(
                  card.iconMap[card.icon],
                  size: 20,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: card.controller,
                  obscureText: card.obscureText,
                  decoration: InputDecoration(
                    hintText: card.placeholder,
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
