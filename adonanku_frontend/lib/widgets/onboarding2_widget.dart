import 'package:flutter/material.dart';
import 'package:adonanku_frontend/models/onboarding_model2.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPageWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 130),
        child: Column(
          children: [
            Image.asset(item.image),
            SizedBox(height: 50),
            Text(item.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Container(
              width: 350,
              child: Text(item.description, style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
