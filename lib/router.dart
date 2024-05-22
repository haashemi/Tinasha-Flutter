import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tinasha_v2/routes/routes.dart';
import 'package:tinasha_v2/widgets/home_shell.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  overridePlatformDefaultLocation: true,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const HomeRoute(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            opaque: false,
          ),
        ),
        GoRoute(
          path: '/list',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ListRoute(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            opaque: false,
          ),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ProfileRoute(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
            opaque: false,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchRoute(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInRoute(),
    ),
  ],
);
