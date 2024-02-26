import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/feature/select_language/select_language.dart';
import 'package:movie_app/feature/splash/splash_screen.dart';
import 'package:movie_app/my_home_app.dart';

RouterConfig<Object> routerConfig = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/selectLanguage',
      builder: (context, state) => const SelectLanguage(),
    ),
    GoRoute(
      path: '/selectLanguage/my-home-app',
      builder: (context, state) => const MyHomeApp(),
    ),
  ],
);
