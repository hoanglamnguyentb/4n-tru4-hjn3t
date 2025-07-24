import 'package:an_trua_hinet/pages/home_page.dart';
import 'package:an_trua_hinet/pages/login_page.dart';
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
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Page Not Found'))),
);
