import 'package:flutter/material.dart';
import 'views/onboarding1_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 

void main() {
  runApp(const ProviderScope(child: Onboarding1App()));
}

class Onboarding1App extends StatelessWidget {
  const Onboarding1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adonanku',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
        fontFamily: 'RadioCanada',
      ),
      home: const Onboarding1View(),
      debugShowCheckedModeBanner: false,
    );
  }
}
