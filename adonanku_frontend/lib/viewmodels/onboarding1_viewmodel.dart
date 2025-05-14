import 'package:flutter/material.dart';

class Onboarding1ViewModel with ChangeNotifier {
  late AnimationController controller;
  late Animation<Offset> slideLeft;
  late Animation<Offset> slideRight;
  late Animation<double> fadeIn;

  void init(TickerProvider ticker) {
    controller = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 1300),
    );

    slideLeft = Tween<Offset>(begin: Offset(-0.3, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    slideRight = Tween<Offset>(begin: Offset(0.3, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    fadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    controller.forward();
  }

  // void dispose() {
  //   controller.dispose();
  // }
}
