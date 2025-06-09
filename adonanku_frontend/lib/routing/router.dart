import 'package:adonanku_frontend/views/dashboard_view.dart';
import 'package:adonanku_frontend/views/inventory_view.dart';
import 'package:adonanku_frontend/views/login_view.dart';
import 'package:adonanku_frontend/views/onboarding1_view.dart';
import 'package:adonanku_frontend/views/onboarding2_view.dart';
import 'package:adonanku_frontend/views/regist_view.dart';
import 'package:adonanku_frontend/views/resep_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding1',
  routes: [
    GoRoute(
      path: '/onboarding1',
      name: 'onboarding1',
      builder: (context, state) => const Onboarding1View(),
    ),
    GoRoute(
      path: '/onboarding2',
      name: 'onboarding2',
      builder: (context, state) => const OnBoarding2Page(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/',
      name: 'dash',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/inventory',
      name: 'inventory',
      builder: (context, state) => const InventoryPage(),
    ),
    GoRoute(
      path: '/resep',
      name: 'resep',
      builder: (context, state) => const ResepPage(),
    ),
  ],

  // Error page
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);
