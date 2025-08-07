import 'package:an_trua_hinet/models/meal.dart';
import 'package:an_trua_hinet/pages/home_page.dart';
import 'package:an_trua_hinet/pages/login_page.dart';
import 'package:an_trua_hinet/pages/meal_detail_page.dart';
import 'package:an_trua_hinet/pages/meal_page.dart';
import 'package:an_trua_hinet/pages/member_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home', // Redirect root to /home
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/member', builder: (context, state) => const MemberPage()),
    GoRoute(path: '/meal', builder: (context, state) => const MealPage()),
    GoRoute(
      path: '/meal/:id',
      name: "mealDetail",
      builder: (context, state) {
        final meal = state.extra as Meal;
        return MealDetailPage(meal: meal);
      },
    ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Page Not Found'))),
);
