import 'package:adonanku_frontend/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: Onboarding1App()));
}

class Onboarding1App extends StatelessWidget {
  const Onboarding1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adonanku',
      routerConfig: appRouter,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
        fontFamily: 'RadioCanada',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
